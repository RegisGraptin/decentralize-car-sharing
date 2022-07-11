// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract CarFactory {

    // TODO :: Rename CarFactory to Car

    enum State {
        NotAvailable,
        Available, 
        Request,
        Booked,
        Rent,
        Return
    }

    event NewCar(uint carId, string name);

    struct Car {
        
        string name;
        string category;
        string typeVehicle;
        string energy;
        string transmission;

        uint mileage;
        
        int16 year;

        uint8 nb_doors;
        uint8 nb_seat;
    }


    Car[] public cars;

    mapping (uint => address) public carToOwner;
    mapping (address => uint) public ownerCarCount;

    function createCar(
        string memory _name, 
        string memory _category, 
        string memory _typeVehicle, 
        string memory _energy, 
        string memory _transmission, 
        uint _mileage, 
        int16 _year, 
        uint8 _nb_door, 
        uint8 _nb_seat
    ) public {
        cars.push(Car(_name, _category, _typeVehicle, _energy, _transmission, _mileage, _year, _nb_door, _nb_seat));
        uint _id = cars.length - 1;
        carToOwner[_id] = msg.sender;
        ownerCarCount[msg.sender]++;
        
        emit NewCar(_id, _name);
    }

}