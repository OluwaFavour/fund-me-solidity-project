// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract FundMe {
    uint256 public minimumUSD = 5;
    
    function fund() public payable {
        // Allow users to send money
        // Have a minimum amount sent
        require(msg.value > minimumUSD); // 1e18 Wei equals 1TTH
    }
}