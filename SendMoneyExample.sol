pragma solidity ^0.8.1;

// ref: https://ethereum-blockchain-developer.com/020-escrow-smart-contract/01-smart-contract-starting/
//
// def(roy): CA - contract account. Codebase that is deployed into blockchain, aka smart-contract.
// def(roy): EOA - Externally-owned account. Exists outside of blockchain.
//
//
// note(roy): this is a smart-contract. Once deployed to blockchain, it will be given an address, and
// also be known as "CA".
contract SendMoneyExample {
    uint256 public balanceReceived;

    // msg is a global always-existing object.
    // - .value: amount of Wei that was sent to this smart contract
    // - .sender: EOA/CA that triggers this smart contract.
    function receiveMoney() public payable {
        balanceReceived += msg.value;
    }

    // note(roy): this is a query function, hence gas-foc.
    //
    // def(roy): 'address' refers to the current CA's address
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    // note(roy): this is a query function, hence gas-foc.
    //
    // def(roy): 'msg.sender' refers to the account that triggers this smart-contract.
    function getSender() public view returns (address) {
        return msg.sender;
    }

    function getSenderBalance() public view returns (uint256) {
        return msg.sender.balance;
    }
}
