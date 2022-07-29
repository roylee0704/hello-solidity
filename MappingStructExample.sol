pragma solidity ^0.8.1;

// ref: https://ethereum-blockchain-developer.com/026-mappings-and-structs/00-overview/
contract MappingStructExample {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(address payable _to, uint256 _amount) public {
        uint256 benificialBalance = balances[_to];
        require(benificialBalance >= _amount, "Not enough funds");

        balances[_to] -= _amount;
        _to.transfer(_amount);
    }

    function balance() public view returns (uint256) {
        return address(this).balance;
    }
}
