pragma solidity ^0.8.1;

contract SendMoneyExample {
    uint256 public balanceReceived;

    function receiveMoney() public payable {
        // msg is a global always-existing object.
        // - .value
        // - .sender
        balanceReceived += msg.value;
    }

    // query function: foc
    function getBalance() public view returns (uint256) {
        // address: refers to contract-account's address
        return address(this).balance;
    }

    function getSender() public view returns (address) {
        // .sender refers to externally-owned-account(EOA) 's address
        return msg.sender;
    }

    function getSenderBalance() public view returns (uint256) {
        return msg.sender.balance;
    }
}
