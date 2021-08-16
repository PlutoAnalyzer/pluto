contract Test2{
    function bug_time_inter(address t, uint b) public payable returns (uint){
    address t1 = Test1(t);
    uint goal_ = t1.getGoal();
    if(goal_ < 6000) {
        if(block.timestamp % b == 0) { // winner    //bug
            msg.sender.transfer(b);
        } 
    }
}
}

contract Test1{
    uint public goal = 5000;
    function getGoal() public returns(uint);
    function testbool(uint p) public returns(bool);
}