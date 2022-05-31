// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract Struct {
    struct Car {
        string model;
        uint year;
        address owner;
    }

    Car public car; // Struct as a state variable;
    Car[] public cars; // Stuct as an array.

    mapping(address => Car[]) public carsByOwner; // Mapping from the owner to cars.

    function examples() external {
        Car memory toyota = Car("Tacoma", 2020, msg.sender);
        Car memory lamborghini = Car({model: "Aventador", year: 2022, owner: msg.sender});
        Car memory tesla; // Default values.

        tesla.model = "X";
        tesla.year = 2020;
        tesla.owner = msg.sender;

        cars.push(toyota);
        cars.push(lamborghini);
        cars.push(tesla);
        cars.push(Car("Ferrari", 2022, msg.sender));

        Car storage _car = cars[0];

        _car.year = 2022;

        delete _car.owner;
        delete cars[1];
    }
}
