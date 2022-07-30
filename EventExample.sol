// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

// ref: https://ethereum-blockchain-developer.com/030-solidity-events/01-contract-example/
contract EventExample {
    mapping(address => uint256) public tokenBalance;
    address public minter;

    constructor() {
        minter = msg.sender;
        tokenBalance[minter] = 100;
    }

    // note(roy): this is not a view function, but returns a value.
    //
    // In test-chain, it will return a value. However on real main-chain, a non-view function
    // will not return a value!
    function mint(address _recipient, uint256 _numTokens)
        public
        returns (bool)
    {
        // validating user input.
        require(tokenBalance[msg.sender] >= _numTokens, "Not enough tokens");

        // invariance: to prevent round-up error in uint
        assert(
            tokenBalance[msg.sender] - _numTokens <= tokenBalance[msg.sender]
        );
        assert(
            tokenBalance[_recipient] + _numTokens >= tokenBalance[_recipient]
        );

        tokenBalance[msg.sender] -= _numTokens;
        tokenBalance[_recipient] += _numTokens;

        emit TokensSent(msg.sender, _recipient, _numTokens);

        // return won't work on non-view function on main network.
        return true;
    }

    event TokensSent(address _sender, address _recipient, uint256 _numTokens);

    /*  event-logs.
        [
            {
                "from": "0xCFd7D39ecA122595A62074B82e207e1C9aAf3430",
                "topic": "0xe607861baff3d292b19188affe88c1a72bdcb69d3015f18bb2cd0bf5349cc3e1",
                "event": "TokensSent",
                "args": {
                    "0": "0x46c019289556f33c292bCa4c497A13e614ac4868",
                    "1": "0x46c019289556f33c292bCa4c497A13e614ac4868",
                    "2": "1",
                    "_sender": "0x46c019289556f33c292bCa4c497A13e614ac4868",
                    "_recipient": "0x46c019289556f33c292bCa4c497A13e614ac4868",
                    "_numTokens": "1"
                }
            }
        ]
*/
}
