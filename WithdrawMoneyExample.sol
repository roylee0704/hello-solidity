// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.1;

contract WithdrawMoneyExample {
    uint256 public balanceReceived;

    // money can be traced from msg object: .value
    function sendMoneyToCurrentAccount() public payable {
        balanceReceived += msg.value;
    }

    function getCurrentAccountBalanceInWei() public view returns (uint256) {
        return address(this).balance;
    }

    function getSenderAccountBalanceInWei() public view returns (uint256) {
        return msg.sender.balance;
    }

    function withdrawMoneyFromCurrentAccount() public {
        balanceReceived -= getCurrentAccountBalanceInWei();

        // alt(roy): payable(msg.sender).transfer(getCurrentAccountBalanceInWei());
        address payable to = payable(msg.sender);
        to.transfer(getCurrentAccountBalanceInWei());
    }
}
