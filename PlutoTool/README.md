# Pluto


A symbolic execution tool for smart contract vulnerabilities detection which supports contract calls based on Oyente.

## Dependencies Installation

### solc
```
$ sudo add-apt-repository ppa:ethereum/ethereum
$ sudo apt-get update
$ sudo apt-get install solc
```

### evm from [go-ethereum](https://github.com/ethereum/go-ethereum)

1. https://geth.ethereum.org/downloads/ or
2. By from PPA if your using Ubuntu
```
$ sudo apt-get install software-properties-common
$ sudo add-apt-repository -y ppa:ethereum/ethereum
$ sudo apt-get update
$ sudo apt-get install ethereum
```

### [z3](https://github.com/Z3Prover/z3/releases) Theorem Prover version 4.5.0.

Download the [source code of version z3-4.5.0](https://github.com/Z3Prover/z3/releases/tag/z3-4.5.0)

Install z3 using Python bindings

```
$ python3 scripts/mk_make.py --python
$ cd build
$ make
$ sudo make install
```

### [Requests](https://github.com/kennethreitz/requests/) library

```
pip3 install requests
```

### [web3](https://github.com/pipermerriam/web3.py) library

```
pip3 install web3
```


## Use the tool


```
#evaluate a local solidity contract
python3 pluto.py -s <contract filename>

#evaluate a remote contract
python3 pluto.py -ru https://gist.githubusercontent.com/loiluu/d0eb34d473e421df12b38c12a7423a61/raw/2415b3fb782f5d286777e0bcebc57812ce3786da/puzzle.sol

```

Run ```python3 pluto.py --help``` for a list of options.
