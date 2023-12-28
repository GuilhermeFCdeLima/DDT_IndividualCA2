// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimplePurchase {
    address public buyer; //Address of the Buyer
    address public seller; //Address of the Seller
    uint public price; // The Agree Price for the transaction
    bool public isPaid; // Boolean indication if the payment has been processed.

    event PurchaseCompleted(address buyer, address seller, uint price);

    constructor(address _seller, uint _priceInEther) {
        buyer = msg.sender; // Buyer is the address used to deploy the contract
        seller = _seller; // Here we define which address is the seller
        price = _priceInEther * 1 ether; // We declare the price multiplied by 1 ether to convert Wei to Ether
        isPaid = false; // Boolean of the transaction
    }

    function pay() public payable {
        require(msg.sender == buyer, "Only the buyer can pay");
        require(msg.value == price, "Incorrect payment amount");
        require(!isPaid, "Payment has already been made");

        isPaid = true;
        emit PurchaseCompleted(buyer, seller, price);
    }
}
