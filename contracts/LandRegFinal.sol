// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.4.25;

pragma experimental ABIEncoderV2;
contract LandRegistration {
    struct User {
        bytes32 fullName;
        bytes32 fatherName;
        bytes32 motherName;
        bytes32 district;
        bytes32 thana;
        uint256 postCode;
        bytes32 village;
        bytes32 email;
        uint256 dob;
        uint256 totalTax;
        string fingerprint;
        bool isExist;
    }

    mapping(uint256 => User) userMapping;
    uint256[] userArray;
    
    event CreationOfUser(uint256 indexed nid);

    function createUser() public {
        require(userMapping[uint256(msg.sender)].isExist != true, "User already exists");
        uint256 nid = uint256(msg.sender);
        
        User storage user = userMapping[nid];
        user.fullName = bytes32(0);
        user.fatherName = bytes32(0);
        user.motherName = bytes32(0);
        user.district = bytes32(0);
        user.thana = bytes32(0);
        user.postCode = 0;
        user.village = bytes32(0);
        user.email = bytes32(0);
        user.dob = 0;
        user.totalTax = 0;
        user.fingerprint = "";
        user.isExist = true;
        
        userArray.push(nid);
        emit CreationOfUser(nid);
    }
    
    function getKhatianArrayLen() public view returns (uint256) {
        return userArray.length;
    }
    
    function getKhatianHasById(uint256 id) public view returns (bool) {
        return userMapping[id].isExist;
    }
    
    function getKhatianByHash(bytes32 khatianHash) public view returns (User) {
        uint256 id = uint256(khatianHash);
        require(userMapping[id].isExist, "User does not exist");
        return userMapping[id];
    }
    
    function getPlotArrayLen() public view returns (uint256) {
        return userArray.length;
    }
    
    function getPlotByHash(bytes32 plotHash) public view returns (User) {
        uint256 id = uint256(plotHash);
        require(userMapping[id].isExist, "User does not exist");
        return userMapping[id];
    }
    
    function getUserArrayLen() public view returns (uint256) {
        return userArray.length;
    }
    
    function getUserIdById(uint256 id) public view returns (User) {
        require(userMapping[id].isExist, "User does not exist");
        return userMapping[id];
    }
    
    function getUserByNid(uint256 _nid) public view returns (User) {
        require(userMapping[_nid].isExist, "User does not exist");
        return userMapping[_nid];
    }
    
    function getUserOwnedByUid(uint256 _uid) public view returns (User) {
        require(userMapping[_uid].isExist, "User does not exist");
        return userMapping[_uid];
    }
    function stringToBytes32(string memory source) internal pure returns (bytes32 result) {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }

        assembly {
            result := mload(add(source, 32))
        }
    }
    
    function toUpper(string str) internal pure returns (string) {
		bytes memory bStr = bytes(str);
		bytes memory bUpper = new bytes(bStr.length);
		for (uint i = 0; i < bStr.length; i++) {
			if ((bStr[i] >= 97) && (bStr[i] <= 122)) {
				bUpper[i] = bytes1(int(bStr[i]) - 32);
			} else {
				bUpper[i] = bStr[i];
			}
		}
		return string(bUpper);
	}
}

/*

1. `createUser()`: Creates a new user and stores their information in the `userMapping` mapping, also adds the user ID to the `userArray`.
2. `getKhatianArrayLen()`: Returns the length of the `userArray`, representing the number of users.
3. `getKhatianHasById(uint256 id)`: Checks if a user with the given ID exists in the `userMapping`.
4. `getKhatianByHash(bytes32 khatianHash)`: Retrieves the user information associated with the given hash value (ID), provided the user exists.
5. `getPlotArrayLen()`: Returns the length of the `userArray`, representing the number of plots.
6. `getPlotByHash(bytes32 plotHash)`: Retrieves the user information associated with the given plot hash value (ID), provided the user exists.
7. `getUserArrayLen()`: Returns the length of the `userArray`, representing the number of users.
8. `getUserIdById(uint256 id)`: Retrieves the user information associated with the given user ID, provided the user exists.
9. `getUserByNid(uint256 _nid)`: Retrieves the user information associated with the given National ID (NID), provided the user exists.
10. `getUserOwnedByUid(uint256 _uid)`: Retrieves the user information associated with the given user ID (UID), provided the user exists.
11. `stringToBytes32(string memory source) internal pure returns (bytes32 result)`: Converts a string to bytes32.
12. `toUpper(string str) internal pure returns (string)`: Converts a string to uppercase.

These functions allow for creating users, retrieving user information by various parameters, and performing utility tasks such as converting strings and modifying their case.
*/