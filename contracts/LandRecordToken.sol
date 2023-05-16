// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract LandRecordToken is ERC20 {
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        _mint(msg.sender, 1000 * 10 ** decimals());
    }

    function createToken(string memory _ownerName, address _ownerAddress) public returns (uint) {
        uint tokenId = uint(keccak256(abi.encodePacked(_ownerName, _ownerAddress)));
        _mint(_ownerAddress, tokenId);
        return tokenId;
    }
}
