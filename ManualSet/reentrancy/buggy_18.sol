contract Test1 {
    uint public goal = 5000;
    function getResult(uint i) public view returns(bool) {
        return goal - i > 1000;
    }
}

contract Test2 {
    function transferMoney (Test1 t1, address addr) public {
        bool res = t1.getResult(4500);
        if (!res) {
            addr.call.value(10)("");
        }
    }
}
