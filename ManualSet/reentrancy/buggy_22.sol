contract Test1 {
  uint public goal = 100;
  function getPulse() public returns (uint) {
    return goal * goal;
  }
}

contract Test2 {
  mapping(address => uint) redeemableEther_re_ent11;
  
  function enter(Test1 pnode, address addr) public returns (bool) {
    if (pnode.getPulse() == 10000) {
        require(redeemableEther_re_ent11[msg.sender] > 0);
        
        uint transferValue_re_ent11 = redeemableEther_re_ent11[msg.sender];
        msg.sender.call.value(transferValue_re_ent11)("");
        redeemableEther_re_ent11[msg.sender] = 0;
    }
    return true;
  }
}
