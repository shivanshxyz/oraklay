// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./Oracle.sol";

contract PriceConsumerWEMIXUSD {

    Oracle public oracleAddress;

    uint public price;

    function requestWemixPrice(
        Oracle _oracleAddress,
        string memory _adapterId
    ) external returns(bool) {

        oracleAddress = _oracleAddress;

        oracleAddress.newOracleRequest(this.setWEMIXUSD.selector, _adapterId, address(this));

        return true;
    }

    function setWEMIXUSD(
        uint _price
    ) external {

        require(msg.sender == address(oracleAddress),"Consumer: Permission Denied");

        price = _price;
    }

}