# SimpleStorage

## Remix IDE

Open this link [to get started]("https://remix.ethereum.org/")

This is an IDE (Integrated Development Environment), a powerful tool used to build and develop smart contracts in Solidity. It helps to easily visualize and interact with our smart contracts. It contains a file explorer that hosts all the files, a Solidity compiler and a tab where you can deploy your contracts.

1. 🧹 Remove all the existing files and folders by right-clicking on them (optional).
2. ✨ Create a new file, e.g., `SimpleStorage.sol`. The `.sol` extension tells the compiler that this is a Solidity file.

## Compiler directive

The `pragma` directive specifies the _version_ of the Solidity compiler that you want to use to build your source file. When the compiler encounters this line, it will check its version against the one you specified here. If the compiler version is different, Remix will automatically adjust accordingly to your specifications.

You can specify the compiler version(s) in the following ways:

1 use exactly **one** version

```solidity
pragma solidity 0.8.19; // use only version 0.8.19
```

2 use versions that fall **within** a lower and upper range

```solidity
// use versions between 0.8.19 and 0.9.0 (excluded)
pragma solidity ^0.8.19;
pragma solidity >=0.8.19 <0.9.0;
```

> 🗒️ **NOTE**:br
> Remember to write comments in your code for you to refer to later on.

## SPDX License Identifier

It's a good practice (even not mandatory) to start your smart contract with an SPDX License Identifier. It helps in making licensing and sharing code easier from a legal perspective.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
```

The MIT license is recognized as one of the most permissive, granting anyone the freedom to use the following code and essentially use it as they see fit.

## Writing the Smart Contract

You can start writing your contract using the keyword `contract` followed by a name, e.g., `SimpleStorage`. All the code inside the curly brackets will be considered part of this contract.

If you are familiar with Object Oriented Programming languages, you can think of a _contract_ as a concept similar to a _class_.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleStorage {
    //this is where we'll place the content of the contract
}
```

## Compiling

1. In Remix IDE, select the Solidity Compiler.
2. Choose the version of the compiler that matches the version specified in your Solidity file.
3. Hit the `Compile` button.

Compiling your code means taking **human-readable code** and transforming it into **computer-readable code** or **bytecode**.

If you see a green checkmark, it means your compilation was successful. If there is any error, Remix will point out where the error is, and you can debug it accordingly.

EVM => Ethereum Virtual Machine

## Types

There are many types in solidity but the most importants are:

1. boolean => true or false
2. uint => unsigned integer => non-negative values
3. int => both positive and negative values
4. address
5. bytes
6. string

You can see the whote types in [here](https://docs.soliditylang.org/en/v0.8.26/types.html)

## Variables

to define a variabe first you write the type of it, then the name of the variable and finally the value of it.

```js
    bool hasFavouriteNumber = true;
    uint256 favouriteNumber = 123;
    string favouriteBook = "Lord of the rings";
    address address = 0x0A48b723D88874EC79a12d12e9745A65eB80dF65;
```

by default variables are private and you can not access then when the contract is deployed. to access then you have to "public" them.

```js
    uint256 public favouriteNumber = 10
```

## Basic Solidity

### Functions

functions or methods execute a subset of code when called.

you need to specify the type of the argument of the function

```js
    function store(uint256 _favouriteNumber) public {
        favouriteNumber = _favouriteNumber;
    }
```

#### Function visibility specifires

1. public => visible externally an internally
2. private => only visible in the current contract
3. external => only visible externally
4. internal => only visible internally => default value

to learn about function/variables visibility you can red the doc [here](https://docs.soliditylang.org/en/v0.8.26/cheatsheet.html#function-visibility-specifiers)

#### Function modifiers

1. view => Disallows modification or access of state, just going to read the state of a contract => cost no gas
2. pure => Disallows modification of state, also disallow you to read from the blockchain state => cost no gas
3. payable
4. constant
5. immutable
6. anonymous
7. indexed
8. virtual
9. override

-   view and pure modifiers do not cost any gas because we are just reading from the blockchain. we only spend gas if we modify the blockchain state.

-   they will cost a gas only when if ad gas calling function calls a view or pure functions.

```js
    // view
    function retrieve() public view returns(uint256) {
        return favouriteNumber;
    }

    // pure
    function add() public pure returns(uint256) {
        return (1 + 1);
    }
```

to learn about function modifiers you can red the doc [here](https://docs.soliditylang.org/en/v0.8.26/cheatsheet.html#modifiers)

### Structs

a way to define new types in the form of structs. [learn more](https://docs.soliditylang.org/en/v0.8.26/types.html#structs)

```js
    struct Person {
        uint256 favouriteNumber;
        string name;
    }

    Person public person = Person({
        favouriteNumber: 10,
        name: "John",
    });
```

### Array

a data structure that holds a llist of other types. [learn more](https://docs.soliditylang.org/en/v0.8.26/types.html#arrays)

Person[] => array of Person struct
public => visibility
people => name of the array

```js
    Person[] public people;
```

#### Size of an Array

People[] => dynamic array
People[5] => fixed-size array

#### Add to array

```js
people.push(
	Person({
		favouriteNumber: _favouriteNumber,
		name: _name,
	})
);
```

### Errrors & Warnings

1. Warning => won't stop your code from working but it's usually a good idea to check them out
2. Error => will stop your code from working

### Memory, Storage & Calldata

EVM can access and store information in six places

1. Memory => variable is only going to exist tempporarily and can be modified
2. Storage => exist even outside of just the function execution and is permanent and can be mofified
3. Calldata => variable is only going to exist tempporarily but can not be modified
4. Stack
5. Code
6. Logs

```js
    function addPerson(string memory _name, uinit256 _favouriteNumber) public {
        _name = "cat"; // if _name is memeory it can be modified, but if it is calldata it is not possible to modified

        people.push(Person({
            favouriteNumber: _favouriteNumber,
            name: _name
        }));
    }
```

-   data location can only be specified for array, struct or mapping types

### Mappings

a data structure where a key is mapped to a single value

```js
    mapping(string => uint256) public nameToFavouriteNumber;

    function addPerson(string memory _name, uinit256 _favouriteNumber) public {
        // string name is being mapped to uint256 favouriteNumber;
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }
```

## Deploying Your Contract

in Remix you can change the environment to "**InjectedProvider**" to connect to your metamask wallet. you can see your wallet address in "ACCOUNT" input
