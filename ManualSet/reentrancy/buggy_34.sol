contract Test1 {
  uint public goal = 33;
  function getThree() public returns (uint) {
    return goal * 3;
  }
}

contract Test2 {
  uint256 counter_re_ent35 = 0;
  
  function enter(Test1 pnode, address addr) public {
    if (pnode.getThree() < 100) {
        msg.sender.call.value(10)("");
        counter_re_ent35 += 1;
    }
  }
}