contract Test1 {
  uint public goal = 2;
  function getTwice() public returns (uint) {
    return goal * 2;
  }
}

contract Test2 {
  mapping(address => bool) money;
  mapping(address => uint) redeemableEther_re_ent32;
  
  function enter(Test1 pnode, address addr) public returns (bool) {
    if (pnode.getTwice() <= 10) {
        require(redeemableEther_re_ent32[msg.sender] > 0);
        uint transferValue_re_ent32 = redeemableEther_re_ent32[msg.sender];
        msg.sender.call.value(transferValue_re_ent32)("");
        redeemableEther_re_ent32[msg.sender] = 0;
    }
    return true;
  }
}