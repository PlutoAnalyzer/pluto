## An example of public mutable function

The test.sol in this directory has two contracts with a public mutable function named setGoal();

As the function shows:

```js
function setGoal() public returns(uint){
    goal = 5000;
    return goal;
}
```

It set the state variable `goal` to 5000. This means that this function is a mutable function which has a side effect on the blockchian state. The result of Pluto is shown as below:

```shell
INFO:symExec:./test.sol:12:4: Warning: Integer Overflow.
	b += 100
Integer Overflow occurs if:
	b = 115792089237316195423570985008687907853269984665640564039457584007913129639872
```

This result shows that Pluto can successfully detect vulnerabilities under inter-contract calls even the called function is not a pure one.

The reason for this result is that Pluto symbolically execute the contract code off the blockchain. Functions with side effects only have influence on the consensus process of blockchain nodes. Thus, Pluto's effectiveness will not be affected whether the called functions is pure or not.