// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;


contract ProductFactory {
    
    uint uniqueIdLength = 10 ** 10;

    event NewProduct(string name, uint productId);
    // event productSold

    struct Product{
        string name;
        uint uniqueId;
        string metaData;
        bool isProductSold;
    }

    Product[] public products;

    mapping (uint => uint) public uniqueIdToProductId;


// Adding Product section

    function _createProduct(string memory _name, uint _uniqueId, string memory _metaData) private {
        //  storing index where new product is added in mapping
        products.push(Product(_name,_uniqueId,_metaData, false));
        uint productId = products.length - 1; // push gives us array length so -1 for index
        uniqueIdToProductId[_uniqueId] = productId;
        emit NewProduct(_name,_uniqueId);

    }

    function _generateUniqueId(string memory _temp) private view returns ( uint ){
        uint random = uint(keccak256(abi.encodePacked(_temp)));
        return random % uniqueIdLength;
    }

    function addProduct(string memory _name,string memory _metaData) public {
        uint Id = _generateUniqueId(_name);
        _createProduct(_name, Id, _metaData);
    }


// Selling Product Section

    function _sellProduct(uint _uniqueId) private {
        uint _retrieveProductId = uniqueIdToProductId[_uniqueId];
        products[_retrieveProductId].isProductSold = true;
        // emit sell product event
    }

    function sellProduct(uint _uniqueId) public {
        _sellProduct(_uniqueId);
    }


// Product Verify Section 
    
    function verifyProduct(uint _uniqueId) public view returns (bool){
        //condition to be added if product does not exist in storage
        uint _retrieveProductId = uniqueIdToProductId[_uniqueId];
        Product memory _product = products[_retrieveProductId];
        return _product.isProductSold;
    }
}