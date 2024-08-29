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

  uint private _totalUsers;

  event ProductPurchased(address indexed user, address owner, uint price);
  event ProductAdded(address indexed owner, string name, uint price);

  constructor(address _token) {
    owner = msg.sender;
    token = IERC20(_token);
    _totalUsers = 0;
  }

  function setSecureAddPercent(uint percent) public isOwner {
    secureAddPercent = percent;
  }

  function getSecureAddPercent() private view isOwner returns (uint) {
    return secureAddPercent;
  }

  function __percentValue(uint _amount) public view returns (uint) {
    return (secureAddPercent * _amount) / 100;
  }

  function __amount(uint _amount) private pure returns (uint) {
    return _amount * (10 ** 18);
  }

  function AddProduct(
    string memory name,
    string memory desc,
    string memory section,
    uint price
  ) {
    // transferTokens(address(this), __amount(price));
    products.push(
      Product(name, desc, section, __amount(price), msg.sender, noOne)
    );
    emit ProductAdded(msg.sender, name, __amount(price));
  }

  modifier isOwner() {
    require(msg.sender == owner);
    _;
  }
}
