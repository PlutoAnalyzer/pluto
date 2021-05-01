contract Test1 {
    bool public goal = false;
    function getGoal() public view returns(bool) {
        return goal;
    }
}

contract Test2 {
    function transferMoney (Test1 t1, address addr) public {
        bool goal = t1.getGoal();
        if (!goal) {
            addr.call.value(10)("");
        }
    }
}
