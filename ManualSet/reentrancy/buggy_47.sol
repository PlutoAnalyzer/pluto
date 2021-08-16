contract Test1 {
  uint public goal = 2;
  function getTwice() public returns (uint);
}

contract Test2 {
  mapping(address => bool) money;
  
  function enter(address p, address addr) public returns (bool) {
    address pnode = Test1(p);
    if (pnode.getTwice() <= 10) {
      msg.sender.call.value(10)("");
      money[addr] = true;
    }
    return true;
  }
}