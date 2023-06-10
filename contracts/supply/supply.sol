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
        address seller;
        bool exists;
    }

    mapping(string => Product) public product;
    mapping(address => bool) public sellers;

    modifier onlyRegisteredseller() {
        require(
            sellers[msg.sender] == true,
            "Only sellers can call this function"
        );
        _;
    }

    modifier onlyseller(uint productId) {
        require(
            msg.sender == product[productId].seller,
            "Only the seller can call this function."
        );
        _;
    }

    modifier onlyValidProduct(uint256 productId) {
        require(product[productId].exists == true, "Product ID not valid");
        _;
    }

    event ProductCreated(uint256 productId, address seller);

    function registerseller() public {
        sellers[msg.sender] = true;
    }

    function registerProduct(
        string calldata _name,
        string calldata _type,
        string calldata _careLevel,
        string calldata _location,
        string calldata _start,
        string calldata _end
    ) public onlyRegisteredseller {
        string memory time = Strings.toString(block.timestamp);
        string memory id = string.concat(_name[0:2], time[3:5]);

        product[id] = Product(
            _name,
            _type,
            _careLevel,
            _location,
            _start,
            _end,
            msg.sender,
            true
        );

        emit ProductCreated(msg.sender, id);
    }

    function changeProductLocation(
        string calldata _id,
        string calldata _location
    ) public onlySeller {
        require(
            keccak256(
                abi.encodePacked(_location) ==
                    keccak256(abi.encodePacked(product[id].currentLocation))
            ),
            "Product already at Location"
        );
        product[id].location = _location;
    }

    function getProductLocation(string calldata productID) public onlyValidProduct returns(string){
        return 
    }
}
