contract Test1 {
    function checkInput(uint i) public pure returns(uint){
        return i % 5;
    }
}

contract Test2 {
    function transferMoney (Test1 t1, address addr) public {
        uint res = t1.checkInput(1000);
        if (res == 0) {
            addr.call.value(10)("");
        }
    }
}
