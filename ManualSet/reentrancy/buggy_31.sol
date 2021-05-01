contract Test1 {
  uint public goal = 1000;
  function getTwice() public returns (uint) {
    return goal * 2;
  }
}

contract Test2 {
  uint256 counter_re_ent35 = 0;
  
  function enter(Test1 pnode, address addr) public returns (bool) {
    if (pnode.getTwice() <= 2000) {
        require(counter_re_ent35 <= 5);
        if( ! (msg.sender.call.value(10)("") ) ){
                revert();
            }
            counter_re_ent35 += 1;
        return true;
    }
    return false;
  }
}