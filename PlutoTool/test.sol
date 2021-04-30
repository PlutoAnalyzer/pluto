/*
This file is part of the Cryptaur Contract.

The CryptaurToken Contract is free software: you can redistribute it and/or
modify it under the terms of the GNU lesser General Public License as published
by the Free Software Foundation, either version 3 of the License, or
(at your option) any later version. See the GNU lesser General Public License
for more details.

You should have received a copy of the GNU lesser General Public License
along with the CryptaurToken Contract. If not, see <http://www.gnu.org/licenses/>.

@author Ilya Svirin <i.svirin@nordavind.ru>
Donation address 0x3Ad38D1060d1c350aF29685B2b8Ec3eDE527452B
*/

pragma solidity ^0.4.19;

contract owned {

    address public owner;
    address public candidate;

    function owned() payable public {
        owner = msg.sender;
    }
    
    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }

    function changeOwner(address _owner) onlyOwner public {
        candidate = _owner;
    }
    
    function confirmOwner() public {
        require(candidate == msg.sender);
        owner = candidate;
        delete candidate;
    }
}

/**
 * @title Part of ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
contract ERC20Base {
    uint public totalSupply;
    function balanceOf(address who) public constant returns (uint);
    function transfer(address to, uint value) public;
}

contract CryptaurRewards {
    function payment(address _buyer, address _seller, uint _amount, address _opinionLeader) public returns(uint fee);
}

contract CryputarReserveFund {
    function depositNotification(uint _amount) public;
    function withdrawNotification(uint _amount) public;
}

/**
 * @title Allows to store liked adsress(slave address) connected to the main address (master address)
 */
contract AddressBook {

    struct AddressRelations {
        SlaveDictionary slaves;
        bool hasValue;
    }

    struct SlaveDictionary
    {
        address[] values;
        mapping(address => uint) keys;
    }

    event WalletLinked(address indexed _master, address indexed _slave);
    event WalletUnlinked(address indexed _master, address indexed _slave);
    event AddressChanged(address indexed _old, address indexed _new);

    mapping(address => AddressRelations) private masterToSlaves;
    mapping(address => address) private slaveToMasterAddress;
    uint8 public maxLinkedWalletCount = 5;

    function AddressBook() public {}

    function getLinkedWallets(address _wallet) public view returns (address[]) {
        return masterToSlaves[_wallet].slaves.values;
    }

    /**
     * Only owner of master wallet can add additional wallet.
     */
    function linkToMasterWalletInternal(address _masterWallet, address _linkedWallet) internal {
        require(_masterWallet != _linkedWallet && _linkedWallet != address(0));
        require(isMasterWallet(_masterWallet));
        require(!isLinkedWallet(_linkedWallet) && !isMasterWallet(_linkedWallet));
        AddressRelations storage rel = masterToSlaves[_masterWallet];
        require(rel.slaves.values.length < maxLinkedWalletCount);    
        rel.slaves.values.push(_linkedWallet);
        rel.slaves.keys[_linkedWallet] = rel.slaves.values.length - 1;
        slaveToMasterAddress[_linkedWallet] = _masterWallet;
        WalletLinked(_masterWallet, _linkedWallet);
    }
 
    function unLinkFromMasterWalletInternal(address _masterWallet, address _linkedWallet) internal {
        require(_masterWallet != _linkedWallet && _linkedWallet != address(0));
        require(_masterWallet == getMasterWallet(_linkedWallet));
        SlaveDictionary storage slaves = masterToSlaves[_masterWallet].slaves;
        uint indexToDelete = slaves.keys[_linkedWallet];
        address keyToMove = slaves.values[slaves.values.length - 1];
        slaves.values[indexToDelete] = keyToMove;
        slaves.keys[keyToMove] = indexToDelete;
        slaves.values.length--;
        delete slaves.keys[_linkedWallet];
        delete slaveToMasterAddress[_linkedWallet];
        WalletUnlinked(_masterWallet, _linkedWallet);
    }

    function isMasterWallet(address _addr) internal constant returns (bool) {
        return masterToSlaves[_addr].hasValue;
    }

    function isLinkedWallet(address _addr) internal constant returns (bool) {
        return slaveToMasterAddress[_addr] != address(0);
    }

    /**
     * Guess that address book already had changing address.
     */ 
    function applyChangeWalletAddress(address _old, address _new) internal {
        require(isMasterWallet(_old) || isLinkedWallet(_old));
        require(_new != address(0));
        if (isMasterWallet(_old)) {
            // Cannt change master address with existed linked
            require(!isLinkedWallet(_new));
            require(masterToSlaves[_new].slaves.values.length == 0);
            changeMasterAddress(_old, _new);
        }
        else {
            // Cannt change linked address with existed master and linked to another master
            require(!isMasterWallet(_new) && !isLinkedWallet(_new));
            changeLinkedAddress(_old, _new);
        }
    }

    function addMasterWallet(address _master) internal {
        require(_master != address(0));
        masterToSlaves[_master].hasValue = true;
    }

    function getMasterWallet(address _wallet) internal constant returns(address) {
        if(isMasterWallet(_wallet))
            return _wallet;
        return slaveToMasterAddress[_wallet];  
    }

    /**
     * Try to find master address by any other; otherwise add to address book as master.
     */
    function getOrAddMasterWallet(address _wallet) internal returns (address) {
        address masterWallet = getMasterWallet(_wallet);
        if (masterWallet == address(0))
            addMasterWallet(_wallet);
        return _wallet;
    }

    function changeLinkedAddress(address _old, address _new) internal {
        slaveToMasterAddress[_new] = slaveToMasterAddress[_old];     
        SlaveDictionary storage slaves = masterToSlaves[slaveToMasterAddress[_new]].slaves;
        uint index = slaves.keys[_old];
        slaves.values[index] = _new;
        delete slaveToMasterAddress[_old];
    }
    
    function changeMasterAddress(address _old, address _new) internal {    
        masterToSlaves[_new] = masterToSlaves[_old];  
        SlaveDictionary storage slaves = masterToSlaves[_new].slaves;
        for (uint8 i = 0; i < slaves.values.length; ++i)
            slaveToMasterAddress[slaves.values[i]] = _new;
        delete masterToSlaves[_old];
    }
}

contract CryptaurDepository{
    enum UnlimitedMode {UNLIMITED, LIMITED}

    event Deposit(address indexed _who, uint _amount, bytes32 _txHash);
    event Withdraw(address indexed _who, uint _amount);
    event Payment(address indexed _buyer, address indexed _seller, uint _amount, address indexed _opinionLeader, bool _dapp);
    event Freeze(address indexed _who, bool _freeze);
    event Share(address indexed _who, address indexed _dapp, uint _amount);
    event SetUnlimited(bool _unlimited, address indexed _dapp);

    ERC20Base cryptaurToken = ERC20Base(0x88d50B466BE55222019D71F9E8fAe17f5f45FCA1);
    address public cryptaurRecovery;
    address public cryptaurRewards;
    address public cryptaurReserveFund;
    address public backend;
    modifier onlyBackend {
        require(backend == msg.sender);
        _;
    }

    mapping(address => uint) internal balances;
    mapping(address => mapping (address => uint256)) public available;
    mapping(address => bool) public freezed;
    mapping(address => mapping(address => UnlimitedMode)) public unlimitedMode;
    bool freezedAll;
  
    function CryptaurDepository() public {}

    function sub(uint _a, uint _b) internal pure returns (uint) {
        assert(_b <= _a);
        return _a - _b;
    }

    function add(uint _a, uint _b) internal pure returns (uint) {
        uint c = _a + _b;
        assert(c >= _a);
        return c;
    }

    /**
     * @dev Function pay wrapper auto share balance.
     * When dapp pay to the client, increase its balance at first. Then share "_amount"
     * of client balance to dapp for the further purchases.
     * 
     * Only dapp wallet should use this function.
     */
   
    
    /**
     * @dev Common internal pay function.
     * OpinionLeader is optional, can be zero.
     */
    function payInternal(address _buyer, address _seller, uint _amount, address _opinionLeader){    

        uint fee;
        if (cryptaurRewards != 0 && cryptaurReserveFund != 0) {
        fee = CryptaurRewards(cryptaurRewards).payment(_buyer, _seller, _amount, _opinionLeader);
        }
        balances[_buyer] = sub(balances[_buyer], _amount);
        balances[_seller] =  add(balances[_seller],_amount - fee);
        if (fee != 0) {
            balances[cryptaurReserveFund] = add(balances[cryptaurReserveFund], fee);
            CryputarReserveFund(cryptaurReserveFund).depositNotification(_amount);
        }
        Payment(_buyer, _seller, _amount, _opinionLeader, false);
    }
    
}