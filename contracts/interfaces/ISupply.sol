pragma solidity ^0.8.0;

interface SupplyChainTrackInterface {
    // Events
    event ProductRegistered(uint256 productId, address manufacturer);
    event SupplyChainEventRecorded(
        uint256 productId,
        string eventType,
        string eventDetails
    );
    event ProductVerified(uint256 productId, bool authenticity);

    // Functions
    function registerProduct(
        string memory productDetails
    ) external returns (uint256);

    function recordSupplyChainEvent(
        uint256 productId,
        string memory eventType,
        string memory eventDetails
    ) external;

    function verifyProduct(uint256 productId) external returns (bool);

    // Getters
    function getProductDetails(
        uint256 productId
    ) external view returns (string memory productDetails);

    function getTotalProducts() external view returns (uint256);

    function getProductAuthenticity(
        uint256 productId
    ) external view returns (bool);
}
