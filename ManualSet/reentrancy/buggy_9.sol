contract Test1 {
    uint public goal1 = 5000;
    uint public goal2 = 3000;
    function getResult() public view returns(bool) {
        return goal1 < goal2;
    }
    function setGoal1(uint i) public {
        goal1 = i;
    }
    function setGoal2(uint i) public {
        goal2 = i;
    }
}

contract Test2 {
    function transferMoney (Test1 t1, address addr) public {
        t1.setGoal1(3000);
        t1.setGoal2(5000);
        bool goal = t1.getResult();
        if (goal) {
            addr.call.value(10)("");
        }
    }
}
