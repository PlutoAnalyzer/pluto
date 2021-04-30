pragma solidity ^0.4.18;
contract TOBToken{
    address public owner;
    function TOBToken() public{
        owner = msg.sender;
    }
    function test() public{
        owner.transfer(msg.value);
    }
}