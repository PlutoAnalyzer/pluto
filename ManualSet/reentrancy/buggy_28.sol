contract Test1 {
  uint public goal = 2;
  function getTwice() public returns (uint) {
    return goal * 2;
  }
}

contract Test2 {
  address private _owner;
  mapping(address => uint) balances_re_ent1;
  
  function enter(Test1 pnode, address addr) public returns (bool) {
    if (pnode.getTwice() <= 10) {
        (bool success,) = msg.sender.call.value(balances_re_ent1[msg.sender ])("");
        if (success)
            balances_re_ent1[msg.sender] = 0;
    }
    return true;
  }
}