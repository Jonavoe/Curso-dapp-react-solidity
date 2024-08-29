// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Meli {
  address public owner;
  uint private secureAddPercent = 5;
  address private noOne = address(0);
  IERC20 private token;

  struct User {
    string name;
    string contact;
    bool updated;
    uint total_product;
    uint[] prducts;
  }

  struct Product {
    string name;
    string desc;
    string section;
    uint price;
    address owner;
    address reserved_by;
  }

  Product[] private products;
  mapping(address => User) public users;
}
