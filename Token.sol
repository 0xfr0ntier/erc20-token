/**
 * ERC20 Token
 *
 * BREIF: An ERC20 token smart contract, can be deployed on any EVM compatible
 * blockchain such as Bainance Smart Chain (BSC).
 *
 * SPDX-License-Identifier: MIT
 */

pragma solidity ^0.8.2;

contract Token {
    mapping(address => uint256) public balances;
    mapping(address => mapping(address => uint256)) public allowance;

    uint256 public totalSupply = 21000000;
    string public name = "Solution";
    string public symbol = "SLN";
    uint256 public decimals = 18;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );

    constructor() {
        balances[msg.sender] = totalSupply;
    }

    function balanceOf(address owner) public view returns (uint256) {
        return balances[owner];
    }

    function transfer(address to, uint256 value) public returns (bool) {
        require(balanceOf(msg.sender) >= value, "Balace too low!");
        balances[msg.sender] -= value;
        balances[to] += value;
        emit Transfer(msg.sender, to, value);
        return true;
    }

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) public returns (bool) {
        require(balanceOf(from) >= value, "Balance too low!");
        require(allowance[from][msg.sender] >= value, "Allowance too low!");
        balances[from] -= value;
        balances[to] += value;
        emit Transfer(from, to, value);
        return true;
    }

    function approve(address spender, uint256 value) public returns (bool) {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }
}
