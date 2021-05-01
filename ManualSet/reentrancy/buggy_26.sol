contract Test1 {
  uint public goal = 1000;
  function getTwice() public returns (uint) {
    return goal * 2;
  }
}

contract Test2 {
  address private _owner;
  mapping(address => uint) balances_re_ent1;

  function withdraw_balances_re_ent1 (Test1 pnode) public {
    if (pnode.getTwice() < 20000) {
        (bool success,) = msg.sender.call.value(balances_re_ent1[msg.sender ])("");
        if (success)
            balances_re_ent1[msg.sender] = 0;
    }
  }
}