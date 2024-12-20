// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; // 0.8.7 and newer version

contract SimpleStorage {
    uint favouriteNumber = 10;

    // string name is being mapped to uint256 favouriteNumber;
    mapping(string => uint256) public nameToFavouriteNumber;

    People public person = People({
        favouriteNumber: 10,
        name: "John"
    });

    struct People {
        uint256 favouriteNumber;
        string name;
    }

    function store(uint256 _favouriteNumber) public {
        favouriteNumber = _favouriteNumber;
    }

    function retrieve() public view returns(uint256) {
        return favouriteNumber;
    }

    function add() public pure returns(uint256) {
        return (1 + 1);
    }

    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        //! way number 1
        // people.push(Person(_favouriteNumber, _name));

        //! Way number 2
        // Person memory newPerson = Person({
        //     favouriteNumber: _favouriteNumber,
        //     name: _name
        // });
        // people.push(newPerson);

        //! Way number 3
        // Person memory newPerson = Person(_favouriteNumber, _name);
        // people.push(newPerson);

        //! Way number 4 - the best in my openion
        people.push(Person({
            favouriteNumber: _favouriteNumber,
            name: _name
        }));

        // mapping
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }
}