contract Crowdsale { function echidna_alwaystrue() public returns (bool) { return(true); }
  uint256 goal = 10000 * 10**18;
  uint256 raised = 0;
  uint256 closeTime;  
  address owner; 
  mapping(address => uint256) deposits;
  uint256 phase; // 0: active, 1: success, 2: refund

  constructor() public {
    closeTime = now + 30 days;
    owner = msg.sender;
  }

  function invest() public payable {
    require(phase == 0 && raised < goal);
    deposits[msg.sender] += msg.value;  
    raised += msg.value; 
  }

  function setPhase(uint256 newPhase) public {
    require((newPhase == 1 && raised >= goal) ||
            (newPhase == 2 && raised < goal
              && now >= closeTime));
    phase = newPhase;
  }
  
  function setOwner(address newOwner) public {
    // require(msg.sender == owner);
    owner = newOwner;  
  }

  function withdraw() public {
    require(phase == 1);
    owner.transfer(raised);
  }

  function refund() public {
    // require(phase == 2);
    raised += msg.value;
    msg.sender.transfer(deposits[msg.sender]);
    deposits[msg.sender] = 0;
  }
}
