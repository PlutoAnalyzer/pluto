contract Test1 {
  uint public goal = 33;
  function getThree() public returns (uint) {
    return goal * 3;
  }
}

contract Test2 {
  address private _owner;
  mapping(address => uint) balances_re_ent1;
  
  function enter(Test1 pnode, address addr) public {
    if (pnode.getThree() < 100) {
        (bool success,) = msg.sender.call.value(balances_re_ent1[msg.sender ])("");
        if (success)
            balances_re_ent1[msg.sender] = 0;
    }
  }
}