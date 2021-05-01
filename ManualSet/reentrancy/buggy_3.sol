contract Test1 {
    uint public goal = 5000;
    function getResult() public view returns(bool) {
        return goal > 3000;
    }
    function setGoal(uint i) public {
        goal = i;
    }
}

contract Test2 {
    function transferMoney (Test1 t1, address addr) public {
        t1.setGoal(2000);
        bool res = t1.getResult();
        if (!res) {
            addr.call.value(10)("");
        }
    }
}
