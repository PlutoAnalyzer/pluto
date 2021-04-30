contract Test1{
    uint public goal = 1000;
    function setGoal() public returns(uint){
        goal = 5000;
        return goal;
    }
}

contract Test2{
    function test2(Test1 t1, uint b) public returns(uint){
        uint goal_ = t1.setGoal();
        if(goal_ == 5000){
            b += 100;
        }
        return b;
    }
}