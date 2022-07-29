// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.1;

// ref: https://ethereum-blockchain-developer.com/020-escrow-smart-contract/05-withdrawal-lock/
contract LockWithdrawalUntilExample {
    uint256 public lockedUtil;
    uint256 public balanceReceived;

    // def(roy): block.timestamp === NOW()
    function deposit() public payable {
        balanceReceived += msg.value;
        lockedUtil = block.timestamp + 1 minutes;
    }

    function withdraw() public {
        if (lockedUtil >= block.timestamp) {
            return;
        }
        balanceReceived -= balance();
        payable(msg.sender).transfer(balance());
    }

    function balance() public view returns (uint256) {
        return address(this).balance;
    }
}
