contract Test2{
  function bug_intou_inter(Test1 t1, uint b) public payable returns (uint){
    uint goal_ = t1.getGoal();
    if(3000 > goal_) {
        b = msg.value - goal_;  // underflow bug inter contract
    }
}
}

contract Test1{
    uint public goal = 1000;
    function getGoal() public returns(uint){
        return goal;
    }
}