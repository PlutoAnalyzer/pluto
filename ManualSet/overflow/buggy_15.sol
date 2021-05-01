contract Test2{
    function bug_intou_inter(Test1 t1, uint b) public returns (uint){
    uint goal_ = t1.getGoal(5000);
    if(3000 > goal_) {
        b += goal_;  // overflow bug inter contract
    }
}
}

contract Test1{
    uint public goal = 3000;
    function getGoal(uint p) public returns(uint){
        if(p > goal)
            return p-goal;
        return goal;
    }
}