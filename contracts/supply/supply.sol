// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/utils/Strings.sol";

contract SupplyChain {
    uint256 totalProducts = 0;
    struct Product {
        string productName;
        string productType;
        string careLevel;
        string currentLocation;
        string depositLocation;
        string receivingLocation;
        address manufacturer;
    }

    mapping(string => Product) public product;
    mapping(address => bool) public manufacturers;

    modifier onlyRegisteredManufacturer() {
        require(
            manufacturers[msg.sender] == true,
            "Only manufacturers can call this function"
        );
        _;
    }

    modifier onlyManufacturer(uint productId) {
        require(
            msg.sender == product[productId].manufacturer,
            "Only the manufacturer can call this function."
        );
        _;
    }

    modifier onlyValidProduct(uint256 productId) {
        require(productId < totalProducts, "Invalid product ID.");
        _;
    }

    modifier onlyHolder(productId){
        require(msg.sender = product[id].holder, 'Not current holder');
        }

    event ProductCreated(uint256 productId, address manufacturer);

    function registerManufacturer() public {
        manufacturers[msg.sender] = true;
    }

    function registerProduct(
        string calldata _name,
        string calldata _type,
        string calldata _careLevel,
        string calldata _location,
        string calldata _start,
        string calldata _end
    ) public onlyRegisteredManufacturer {
        string memory time = Strings.toString(block.timestamp);
        string memory id = string.concat(_name[0:2], time[3:5]);

        product[id] = Product(
            _name,
            _type,
            _careLevel,
            _location,
            _start,
            _end,
            msg.sender
        );

        emit ProductCreated(msg.sender, id);
    }

    function changeProductLocation(string calldata _id, string calldata _location) public onlyHolder{
        require(keccak256(abi.encodePacked(_location) == keccak256(abi.encodePacked(product[id].currentLocation);)), 'Product already at Location');
        product[id].location = _location;       
    }

    function chaangeHolder

    
}

