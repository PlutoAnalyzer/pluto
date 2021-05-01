contract Test1 {
  uint public goal = 2;
  function getTwice() public returns (uint) {
    return goal * 2;
  }
}

contract Test2 {
  bool trans;
  uint counter_re_ent35 = 4;
  
  function enter(Test1 pnode, uint x, address addr) public returns (bool) {
    if (pnode.getTwice() <= 10) {
      require(counter_re_ent35<=5);
	  if( ! (msg.sender.call.value(10)("") ) ){
            revert();
        }
    }
    return true;
  }
}