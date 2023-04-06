// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "../lib/forge-std/src/Test.sol";
import "../src/FavoriteColor.sol";


contract FavoriteColorTest is Test {
    FavoriteColor public favoriteColor;

    function setUp() public {
        favoriteColor = new FavoriteColor();
    }

    function testSetFavColor() public {
        vm.prank(address(0));
        bytes memory colorBytes = favoriteColor.setFavColor("blue");
        assertEq(favoriteColor.favColors(address(0)), colorBytes);
    }
    function testGetFavColor() public {
        bytes memory colorBytes = favoriteColor.setFavColor("red");
        string memory colorString = favoriteColor.getFavColor(colorBytes);
        assertEq(colorString, "red");
    }
}