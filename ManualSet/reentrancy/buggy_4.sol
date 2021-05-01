contract Test1 {
    uint public goal = 5000;
    function getGoal() public view returns(uint) {
        return goal % 2;
    }
}

contract Test2 {
    function transferMoney (Test1 t1, address addr) public {
        uint goal = t1.getGoal();
        if (goal == 0) {
            addr.call.value(10)("");
        }
    }
}
