contract Test1 {
  uint public goal = 1000;
  function getTwice() public returns (uint) {
    return goal * 2;
  }
}

contract Test2 {
  mapping(address => uint) money;
  
  function enter(Test1 pnode, address addr) public returns (bool) {
    // Oyente gets a very large value
    if (pnode.getTwice() <= 2000) {
      msg.sender.call.value(money[addr])("");
      money[addr] = 0;
    }
    return true;
  }
}