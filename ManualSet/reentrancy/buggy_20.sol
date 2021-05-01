contract Test1 {
    bool public goal1 = false;
    bool public goal2 = false;
    function getResult() public view returns(bool) {
        return goal1 || goal2;
    }
    function setGoal1(uint i) public {
        goal1 = i < 4000;
    }
    function setGoal2(uint i) public {
        goal2 = i > 4000;
    }
}

contract Test2 {
    function transferMoney (Test1 t1, address addr) public {
        t1.setGoal1(5000);
        t1.setGoal2(3000);
        require(!t1.getResult());
        addr.call.value(10)("");
    }
}
