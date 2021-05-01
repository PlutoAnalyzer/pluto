contract Test1 {
    uint public goal = 5000;
    function getResult() public view returns(bool) {
        return goal % 2 != 0;
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
