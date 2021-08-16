contract Test1 {
    uint public goal = 1000;
    function getGoal() public view returns(uint);
}

contract Test2 {
    function transferMoney (Test1 t, address addr) public {
        address t1 = Test1(t);
        uint goal = t1.getGoal();
        if (1000 == goal) {
            addr.call.value(goal)();
        }
    }
}
