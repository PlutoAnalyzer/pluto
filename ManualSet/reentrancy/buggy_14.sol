contract Test1 {
    uint public goal = 5000;
    uint public anotherGoal = 6000;
    function getGoal() public view returns(uint) {
        return goal;
    }
    function getAnotherGoal() public view returns(uint) {
        return anotherGoal;
    }
}

contract Test2 {
    function transferMoney (Test1 t1, address addr) public {
        uint goal = t1.getGoal();
        uint anotherGoal = t1.getAnotherGoal();
        if (anotherGoal < 7000 && goal > 4000) {
            addr.call.value(10)("");
        }
    }
}
