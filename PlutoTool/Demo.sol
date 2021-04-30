contract Demo1{
    uint public goal = 2000;
    function getGoal() public returns(uint){
        return goal;
    }
}

contract Demo2{
    function test_2(Demo1 demo1, uint b) public returns (uint){
        uint goal_ = demo1.getGoal();
        if(2000 == goal_){
            b += goal_;
	    b += goal_;
	    if (2000 + b < goal_ + 2376){
		uint le = b + 10000;
	    }
        }
        return b;
    }
}

contract Demo3{
    function test_3(Demo1 demo1, uint b) public returns (uint){
        uint goal_ = demo1.getGoal();
        if(3000 < goal_){
            b += goal_;
        }
        return b;
    }
}
