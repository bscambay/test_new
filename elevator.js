var events = require("events");
var elevator = {

    currentFloor: 1, // 1 = lobby
    targetFloor: 1, // where I'm going
    direction: up,
    moving: false,

    // Method: open the door
    openDoor: function (callback) {
        // Open the door
        var opening = this;
        console.log('Doors are open');
        // Event: door has opened
        // No other state changes 
        callback(undefined);
    },
    // Method: board the elevator
    getOnElevator: function (callback) {
        // Can only happen if door is open


    },
    // Method: close the door
    closeDoor: function (callback) {
        // Close the door

        // Event: door has closed
        // State changed: # of passengers
        callback(undefined, numberOfPassengers);
    },

    // Method: sets the target floor
    pressButton: function (floor, callback) {
        // Set the target floor
        targetFloor = floor;

        // Start moving
        if (targetFloor > currentFloor) {
            // move up

            // Event: elevator is moving
            callback(undefined, targetFloor, moving, direction);
        }
        else if (targetFloor < currentFloor) {
            // move down

            // Event: Elevator is moving
            callback(undefined, targetFloor, moving, direction);
        }
        else // targetFloor == currentFloor
        {
            // Event: error 
            callback("You are already on that floor");
        }
    }



}