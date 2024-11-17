// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import "@openzeppelin/contracts@5.1.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@5.1.0/access/Ownable.sol";
import "@openzeppelin/contracts@5.1.0/token/ERC20/extensions/ERC20Permit.sol";

contract ScamToken is ERC20, Ownable, ERC20Permit {
    uint256 public constant MAX_SUPPLY = 500 * 10**18; // Maximum 500 tokens (with 18 decimals)

    constructor(address initialOwner)
        ERC20("ScamToken", "SCMT")
        Ownable(initialOwner)
        ERC20Permit("ScamToken")
    {
        _mint(msg.sender, 1000 * 10 ** decimals());
    }
    
    /**
     * @dev Allows anyone to mint tokens as long as the total supply doesn't exceed the cap.
     * @param amount The number of tokens to mint (with decimals considered).
     */
    function mint(uint256 amount) public {
        require(totalSupply() + amount <= MAX_SUPPLY, "Minting exceeds the maximum supply");
        _mint(msg.sender, amount);
    }
}
