contract Test2{
    function bug_intou_inter(Test1 t1, uint b) public returns (uint){
    uint goal_ = t1.getGoal();
    if(!t1.testbool(5000)) {
        b -= goal_;  // underflow bug inter contract
    }
}
}

contract Test1{
    uint public goal = 5000;
    function getGoal() public returns(uint){
        return goal;
    }
    function testbool(uint a) public returns(bool){
        return (a > goal);
    }
}