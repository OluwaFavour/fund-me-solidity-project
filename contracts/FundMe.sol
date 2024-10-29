// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {PriceConverter} from "libraries/PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    uint256 public minimumUSD = 5e18;

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    function fund() public payable {
        // Allow users to send money
        // Have a minimum amount sent
        require(msg.value.getConversionRate() > minimumUSD, "Didn't send enough ETH"); // 1e18 Wei equals 1ETH
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }
}