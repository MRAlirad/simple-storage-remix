# Solidity

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

```bash
    bool hasFavouriteNumber = true;
    uint256 favouriteNumber = 123;
    string favouriteBook = "Lord of the rings";
    address address = 0x0A48b723D88874EC79a12d12e9745A65eB80dF65;
```

by default variables are private and you can not access then when the contract is deployed. to access then you have to "public" them.

```bash
    uint256 public favouriteNumber = 10
```

## Basic Solidity

### Functions

functions or methods execute a subset of code when called.

you need to specify the type of the argument of the function

```bash
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

```bash
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

```bash
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

```bash
    Person[] public people;
```

#### Size of an Array

People[] => dynamic array
People[5] => fixed-size array

#### Add to array

```bash
    people.push(Person({
        favouriteNumber: _favouriteNumber,
        name: _name
    }));
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

```bash
    function addPerson(string memory _name, uinit256 _favouriteNumber) public {
        _name = "cat"; // if _name is memeory it can be modified, but if it is calldata it is not possible to modified

        people.push(Person({
            favouriteNumber: _favouriteNumber,
            name: _name
        }));
    }
```

-   data location can only be specified for array, struct or mapping types