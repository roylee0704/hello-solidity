pragma solidity ^0.8.1;

// ref: https://ethereum-blockchain-developer.com/026-mappings-and-structs/00-overview/
contract MappingStructExample {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function transfer(address payable _to, uint256 _amount) public {
        uint256 myBalance = balances[msg.sender];
        require(myBalance > _amount, "Not enough funds");

        balances[msg.sender] -= _amount;
        _to.transfer(_amount);
    }

    function balance() public view returns (uint256) {
        return address(this).balance;
    }
}
