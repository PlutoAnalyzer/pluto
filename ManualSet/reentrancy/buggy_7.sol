contract Test1 {
    bool public goal = false;
    function getGoal() public view returns(bool) {
        return goal;
    }
    function setGoal() public {
        goal = true;
    }
}

contract Test2 {
    function transferMoney (Test1 t1, address addr) public {
        t1.setGoal();
        bool goal = t1.getGoal();
        if (goal) {
            addr.call.value(10)("");
        }
    }
}
