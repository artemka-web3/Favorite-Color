// SPDX-License-Identifier: MIT
// this project created for learning proposes
// doing this project I didn't want to create sth real-world applyable
// By developing this project I just want to pratice Foundry and Solidity knowledge
pragma solidity 0.8.18;
import "../lib/openzeppelin-contracts/contracts/proxy/utils/Initializable.sol";
import "../lib/openzeppelin-contracts/contracts/proxy/utils/UUPSUpgradeable.sol";
import "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";


contract FavoriteColor is Initializable, UUPSUpgradeable, Ownable {
    event EncodeColor(string indexed stringColor, bytes prevColor, bytes bytesColor);
    event DecodeColor(string indexed stringColor, bytes bytesColor);


    mapping(address => bytes) public favColors;


    function initialize() public initializer {}
    function _authorizeUpgrade(address) internal override onlyOwner {}

    function setFavColor(string calldata _color) external returns(bytes memory) {
        bytes memory colorBytes = abi.encode(_color);
        favColors[msg.sender] = colorBytes;
        emit EncodeColor(_color, favColors[msg.sender], colorBytes);
        return colorBytes;
    }
    function getFavColor(bytes calldata _colorBytes) external returns(string memory){
        string memory colorString = abi.decode(_colorBytes, (string));
        emit DecodeColor(colorString, _colorBytes);
        return colorString;
    }



}