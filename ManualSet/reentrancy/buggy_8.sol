contract Test1 {
    uint public goal = 5000;
    function getResult(uint i) public view returns(bool) {
        return goal > i;
    }
    function setGoal(uint i) public {
        goal = i;
    }
}

contract Test2 {
    function transferMoney (Test1 t1, address addr) public {
        bool goal = t1.getResult(3000);
        if (goal) {
            addr.call.value(10)("");
        }
    }
}
