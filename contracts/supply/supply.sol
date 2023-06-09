// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SupplyChain {
    address manufacturer;
    uint256 totalProducts;

    struct Product{
        string productName;
        string productType;
        string careLevel;
        string currentLocation;
        string depositLocation;
        string receivingLocation;
    }

    struct manufacturer{}

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

    function registerProduct external(){

    }
}
