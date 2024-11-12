# SimpleStorage

## Remix IDE

Open this link [to get started](https://remix.ethereum.org/)

This is an IDE (Integrated Development Environment), a powerful tool used to build and develop smart contracts in Solidity. It helps to easily visualize and interact with our smart contracts. It contains a file explorer that hosts all the files, a Solidity compiler and a tab where you can deploy your contracts.

1. 🧹 Remove all the existing files and folders by right-clicking on them (optional).
2. ✨ Create a new file, e.g., `SimpleStorage.sol`. The `.sol` extension tells the compiler that this is a Solidity file.

### Compiler directive

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

### SPDX License Identifier

It's a good practice (even not mandatory) to start your smart contract with an SPDX License Identifier. It helps in making licensing and sharing code easier from a legal perspective.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
```

The MIT license is recognized as one of the most permissive, granting anyone the freedom to use the following code and essentially use it as they see fit.

### Writing the Smart Contract

You can start writing your contract using the keyword `contract` followed by a name, e.g., `SimpleStorage`. All the code inside the curly brackets will be considered part of this contract.

If you are familiar with Object Oriented Programming languages, you can think of a _contract_ as a concept similar to a _class_.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleStorage {
    //this is where we'll place the content of the contract
}
```

### Compiling

1. In Remix IDE, select the Solidity Compiler.
2. Choose the version of the compiler that matches the version specified in your Solidity file.
3. Hit the `Compile` button.

Compiling your code means taking **human-readable code** and transforming it into **computer-readable code** or **bytecode**.

If you see a green checkmark, it means your compilation was successful. If there is any error, Remix will point out where the error is, and you can debug it accordingly.

EVM => Ethereum Virtual Machine

## Solidity Types

Solidity supports various _elementary_ types that can be combined to create more _complex_ ones. You can read more about them in the [Solidity documentation](https://docs.soliditylang.org/en/v0.8.20/types.html#types).

🕵️‍♂️ For now, let's focus on the most commonly used

-   Boolean (bool): true or false
-   Unsigned Integer (uint): unsigned whole number (positive)
-   Integer (int): signed whole number (positive and negative)
-   Address (address): 20 bytes value. An example of an address can be found within your MetaMask account.
-   Bytes (bytes): low-level raw byte data

### Variables definition

Variables are just placeholders for **values**. A value can be one **data type** described in the list above. For instance, we could create a Boolean variable named `hasFavoriteNumber`, which would represent whether someone has a favourite number or not (constant `true` or `false`).

```solidity
bool hasFavoriteNumber = true; // The variable `hasFavoriteNumber` represents the value `true`
```

It's possible to specify the number of **bits** used for `uint` and `int`. For example, uint256 specifies that the variable has 256 bits. uint is a shorthand for uint256.

> 🗒️ **NOTE**:br
> It's always advisable to be **explicit** when specifying the length of the data type.

The _semicolon_ at the end of each line signifies that a statement is completed.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract SimpleStorage {
    // Basic types
    bool hasFavoriteNumber = true;
    uint256 favoriteNumber = 88;
    string favoriteNumberInText = "eighty-eight";
    int256 favoriteInt = -88;
    address myAddress = 0xaB1B7206AA6840C795aB7A6AE8b15417b7E63a8d;
    bytes32 favoriteBytes32 = "cat";
}
```

### Bytes and strings

Bytes are a _collection of characters_ written in hexadecimal representation.

```solidity
bytes1 minBytes = "I am a fixed size byte array of 1 byte";
bytes32 maxBytes = "I am a fixed size byte array of 32 bytes";
bytes dynamicBytes = "I am a dynamic array, so you can manipulate my size";
```

Bytes can be allocated in size (up to `bytes32`). However, bytes and bytes32 represent distinct data types.

**Strings** are internally represented as _dynamic byte arrays_ (`bytes` type) and designed specifically for working with text. For this reason, a string can easily be converted into bytes.

[Bits and Bytes overview](https://www.youtube.com/watch?v=Dnd28lQHquU)

### The contract logic

📋 Let's explore a scenario where there is a task involving the storage of a favourite number. For this purpose, we can start storing the variable `favoriteNumber` of type `uint`:

```solidity
uint256 favoriteNumber;
```

> 👀❗**IMPORTANT**:br
> Every variable in Solidity comes with a _default value_. Uninitialized uint256 for example, defaults to `0` (zero) and an uninitialized boolean defaults to `false`.

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
