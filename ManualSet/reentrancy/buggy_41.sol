contract Test1 {
  uint public goal = 2;
  function getTwice() public returns (uint);
}

contract Test2 {
  bool not_called_re_ent41 = true;
  
  function enter(address p, uint x, address addr) public returns (bool) {
    address pnode = Test1(p);
    if (pnode.getTwice() <= 10) {
        require(not_called_re_ent41);
        if( ! (msg.sender.call.value(10)("") ) ){
            revert();
        }
        not_called_re_ent41 = false;
    }
    return not_called_re_ent41;
  }
}