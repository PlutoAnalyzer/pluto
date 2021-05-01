contract Test1 {
    bool public flag = true;
    function getGoal() public view returns(uint) {
        if (flag) return 5000;
        else return 3000;
    }
}

contract Test2 {
    function transferMoney (Test1 t1, address addr) public {
        uint goal = t1.getGoal();
        if (3000 < goal) {
            addr.call.value(10)("");
        }
    }
}
