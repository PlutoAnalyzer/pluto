contract Test1 {
    uint public goal = 5000;
    uint public anotherGoal = 6000;
    function getResult() public view returns(bool){
        return anotherGoal < goal;
    }
}

contract Test2 {
    function transferMoney (Test1 t1, address addr) public {
        bool res = t1.getResult();
        if (!res) {
            addr.call.value(10)("");
        }
    }
}
