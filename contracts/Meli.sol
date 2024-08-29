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
  ) public {
    transferTokens(address(this), __amount(__percentValue(price)), msg.sender);

    products.push(
      Product(name, desc, section, __amount(price), msg.sender, noOne)
    );
    emit ProductAdded(msg.sender, name, __amount(price));
  }

  function transferTokens(address _owner, uint _price, address _buyer) private {
    require(
      _price <= token.balanceOf(_buyer),
      "Insuficient tokens to make transfer"
    );
    require(
      token.allowance(_buyer, address(this)) >= _price,
      "Insuficient allowence to make reserve"
    );

    bool sent = token.transferFrom(_buyer, _owner, _price);
    require(sent, "Not sent");
  }

  function updateProductPrice(uint product_id, uint price) public {
    require(msg.sender != noOne);
    Product storage product = products[product_id];
    require(msg.sender == product.owner);
    require(product.reserved_by == noOne);
    product.price = __amount(price);
  }

  function updateUserContact(string memory contact, string memory name) public {
    require(msg.sender != noOne);
    User storage user = users[msg.sender];
    user.contact = contact;
    user.name = name;

    if (!user.updated) _totalUsers++;

    user.updated = true;
  }

  modifier isOwner() {
    require(msg.sender == owner);
    _;
  }
}
