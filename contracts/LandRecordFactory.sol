
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


import "./LandRecord.sol";

contract LandRecordFactory {
    address[] public deployedLandRecords;

    function createLandRecord(string memory _ownerName, uint _area, address _ownerAddress) public {
        LandRecord newLandRecord = new LandRecord(msg.sender);
        newLandRecord.createRecord(_ownerName, _area, _ownerAddress);
        deployedLandRecords.push(address(newLandRecord));
    }

    function getDeployedLandRecords() public view returns (address[] memory) {
        return deployedLandRecords;
    }
}
