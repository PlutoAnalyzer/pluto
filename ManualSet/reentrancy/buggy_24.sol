contract Test1 {
  uint public goal = 33;
  function getThree() public returns (uint) {
    return goal * 3;
  }
}

contract Test2 {
  mapping(address => uint) money;
  
  function enter(Test1 pnode, address addr) public {
    if (pnode.getThree() < 100) {
      msg.sender.call.value(money[addr])("");
      money[addr] = 0;
    }
  }
}