contract Test2{
  function bug_time_inter(Test1 t1, uint b) public payable returns (uint){
    uint goal_ = t1.getGoal();
    if(3000 > goal_) {
        if(now % b == 0) { // winner    //bug
            msg.sender.transfer(goal_);
        } 
    }
}
}

contract Test1{
    uint public goal = 5000;
    function getGoal() public returns(uint){
        return goal;
    }
}