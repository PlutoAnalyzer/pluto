contract RuleContract{
    uint private base_threshold = 50000;
    function getThreshold(uint currentTarget) 
            public returns(uint){
        require(currentTarget <= 5);
        if(currentTarget == 1){ 
            return base_threshold;
        }
        else{
            uint res = currentTarget*1000;
            return res;
        }
    }
}

contract InvestContract{
    uint public total = 0;
    uint public invalidToken = 0;
    function invest(
      RuleContract rule, 
      uint target, 
      uint investToken) public {
        uint threshold = rule.getThreshold(target);
        if(threshold <= 50000 && 
            threshold <= investToken){ 
            // overflow occurs
            total += investToken;
        }
        else if(threshold > 50000){ 
            // no overflows in this branch
            invalidToken += investToken;
        }
    }
}
