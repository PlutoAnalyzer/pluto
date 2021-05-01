contract Test1 {
    uint public goal = 5000;
    function getResult(uint i) public view returns(bool) {
        return goal != i;
    }
}

contract Test2 {
    function transferMoney (Test1 t1, address addr) public {
        bool res = t1.getResult(5000);
        if (!res) {
            addr.call.value(10)("");
        }
    }
}
