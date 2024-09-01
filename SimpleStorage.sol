// SPDX-License-Identifier: MIT
//? Version of the solidity
pragma solidity ^0.8.8; // 0.8.7 and newer version

// to create a contract we use the keyword "contract". it is like "class" in JS
// "SimpleStorage" => the name of the contract
contract SimpleStorage {
    uint favouriteNumber = 10;

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
    }
}