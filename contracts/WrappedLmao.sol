// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract WrappedLMAO is ERC20 {
    constructor() ERC20("Laughing", "LMAO") {
        _mint(msg.sender, 1000000000000000000000000 * 10 ** decimals());
    }

    function wrap(uint256 amount) external {
        require(amount <= address(this).balance, "Insufficient balance");
        _burn(msg.sender, amount);
        payable(msg.sender).transfer(amount);
    }

    function unwrap(uint256 amount) external {
        require(amount <= balanceOf(msg.sender), "Insufficient balance");
        _mint(msg.sender, amount);
        payable(msg.sender).transfer(amount);
    }

    receive() external payable {}
}