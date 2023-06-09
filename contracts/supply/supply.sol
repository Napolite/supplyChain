// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SupplyChain {
    address manufacturer;
    uint256 totalProducts;

    modifier onlyManufacturer() {
        require(
            msg.sender == manufacturer,
            "Only the manufacturer can call this function."
        );
        _;
    }

    modifier onlyValidProduct(uint256 productId) {
        require(productId < totalProducts, "Invalid product ID.");
        _;
    }
}
