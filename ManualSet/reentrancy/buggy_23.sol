contract Test1 {
  uint public goal = 2;
  function getTwice() public returns (uint) {
    return goal * 2;
  }
}

contract Test2 {
  mapping(address => bool) money;
  
  function enter(Test1 pnode, address addr) public returns (bool) {
    if (pnode.getTwice() <= 10) {
      msg.sender.call.value(10)("");
      money[addr] = true;
    }
    return true;
  }
}