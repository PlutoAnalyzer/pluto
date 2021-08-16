contract Test2{
    function bug_intou_inter(address callee, uint b) public payable returns (uint){
    address t1 = Test1(callee);
    uint goal_ = t1.getGoal();
    if(3000 > goal_) {
        b += goal_;  // overflow bug inter contract
    }
}
}

contract Test1{
    uint public goal = 2000;
    function getGoal() public returns(uint);
    function testbool(uint a) public returns(bool);
}