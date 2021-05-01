contract Test1 {
  uint public goal = 33;
  function getThree() public returns (uint) {
    return goal * 3;
  }
}

contract Test2 {
  mapping(address => uint) money;
  mapping(address => uint) redeemableEther_re_ent32;
  
  function enter(Test1 pnode, address addr) public {
    if (pnode.getThree() < 100) {
        require(redeemableEther_re_ent32[msg.sender] > 0);
        uint transferValue_re_ent32 = redeemableEther_re_ent32[msg.sender];
        msg.sender.call.value(transferValue_re_ent32)("");
        redeemableEther_re_ent32[msg.sender] = 0;
    }
  }
}