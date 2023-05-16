// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./LandRecordToken.sol";

contract LandRecord {
    struct Record {
        uint id;
        string ownerName;
        uint area;
        address ownerAddress;
        uint tokenId;
    }

    uint public recordCount;
    mapping (uint => Record) public records;
    mapping (address => uint[]) public ownerRecords;

    LandRecordToken public token;

    event RecordCreated(uint id, string ownerName, uint area, address ownerAddress);

    constructor(LandRecordToken _token) {
        token = _token;
    }

    function createRecord(string memory _ownerName, uint _area, address _ownerAddress) public {
        recordCount++;
        uint tokenId = token.createToken(_ownerName, _ownerAddress);
        records[recordCount] = Record(recordCount, _ownerName, _area, _ownerAddress, tokenId);
        ownerRecords[_ownerAddress].push(recordCount);
        emit RecordCreated(recordCount, _ownerName, _area, _ownerAddress);
    }

    function getRecordsByOwner(address _ownerAddress) public view returns (uint[] memory) {
        return ownerRecords[_ownerAddress];
    }
}
