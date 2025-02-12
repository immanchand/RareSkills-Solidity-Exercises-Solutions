// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract CrossContract {
    /**
     * The function below is to call the price function of PriceOracle1 and PriceOracle2 contracts below and return the lower of the two prices
     */

    function getLowerPrice(
        address _priceOracle1,
        address _priceOracle2
    ) external returns (uint256) {
        // your code here
        (bool ok1, bytes memory result1) = _priceOracle1.call(abi.encodeWithSignature("price()"));
        require(ok1, "Oracle 1 call failed");
        (bool ok2, bytes memory result2) = _priceOracle2.call(abi.encodeWithSignature("price()"));
        require(ok2, "Oracle 2 call failed");
        uint256 o1price = abi.decode(result1, (uint256));
        uint256 o2price = abi.decode(result2, (uint256));
        if(o1price<=o2price)
            return o1price;
        return o2price;
    }
}

contract PriceOracle1 {
    uint256 private _price;

    function setPrice(uint256 newPrice) public {
        _price = newPrice;
    }

    function price() external view returns (uint256) {
        return _price;
    }
}

contract PriceOracle2 {
    uint256 private _price;

    function setPrice(uint256 newPrice) public {
        _price = newPrice;
    }

    function price() external view returns (uint256) {
        return _price;
    }
}