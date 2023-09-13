// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract LMAO is ERC20, ERC20Burnable, Ownable, ERC20Permit {
    using SafeMath for uint256;
    
    uint256 private constant TAX_PERCENTAGE = 8;
    
    constructor() ERC20("Laughing", "LMAO") ERC20Permit("Laughing") {
        _mint(msg.sender, 1000000000000000000000000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
    
    function _transfer(address sender, address recipient, uint256 amount) internal override {
        uint256 taxAmount = amount.mul(TAX_PERCENTAGE).div(100);
        uint256 transferAmount = amount.sub(taxAmount);
        
        super._transfer(sender, recipient, transferAmount);
        super._transfer(sender, address(this), taxAmount);
    }
}