migrate:
	truffle migrate --network ganache --reset

# alt: run ganache-app on mac.
# ref: https://ethereum.stackexchange.com/questions/64557/truffle-v5-runs-out-of-gas-but-truffle-v4-deploys-the-contract
ganache: 
	ganache -p 7545 --gasLimit=0x1fffffffffffff --chain.allowUnlimitedContractSize -e 1000000000