// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

// ref: https://ethereum-blockchain-developer.com/028-fallback-view-constructor/03-the-solidity-constructor/
contract ConstructorExample {
    address payable public owner;

    // note(roy): only be called once during deployment. Hence, msg.sender = deployer
    constructor() {
        owner = payable(msg.sender);
    }

    function destroy() public {
        require(owner == msg.sender, "You are not the owner");
        selfdestruct(owner);
    }
}
