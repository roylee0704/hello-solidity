pragma solidity ^0.8.1;

// ref: https://ethereum-blockchain-developer.com/025-simple-mappings/01-mappings-smart-contract/
contract SimpleMappingExample {
    mapping(uint256 => bool) public myMapping;
    mapping(address => bool) public whitelisted;

    function setValue(uint256 _index) public {
        myMapping[_index] = true;
    }

    // whitelisting, admin logins
    function whitelistMe() public {
        whitelisted[msg.sender] = true;
    }
}
