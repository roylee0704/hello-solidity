pragma solidity ^0.8.1;

contract SendMoneyExample {
    uint256 public balanceReceived;

    function receiveMoney() public payable {
        balanceReceived += msg.value;
    }

    function getBalance() public view returns (uint256) {
        // ths
        return address(this).balance;
    }
}
