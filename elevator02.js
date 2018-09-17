
var events = require("events");
var emitter = new events.EventEmitter();
var elevator = {

    currentFloor: 1, // 1 = lobby
    targetFloor: 1, // where I'm going
    direction: 'up',
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
        console.log('Passengers are getting on');
        callback(undefined);
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
    },

    doorsOpen: function () {
        this.openDoor = true;
        emitter.emit("DoorsOpen");
    },
    passengersgetson: function () {
        this.getOnElevator = true;
        emitter.emit("PassengerGetson");
    },


    changeState: function () {

        var rnd = Math.ceil(Math.random() * 4);

        switch (rnd) {
            case 1:
                this.doorsOpen();
                break;
            case 2:
                this.passengersgetson();
                break;
            default:
                break;
        }
    },
    displayState: function () {
        var conditions = [];

        if (this.doorsOpen) conditions.push("doors are open");
        if (this.passengersgetson) conditions.push("passengers gets on");
       /* if (this.wet) conditions.push("wet");
        if (this.gassy) conditions.push("gassy");*/

        if (conditions.length) {
            var str = "Elevator ";
            var sep = "";

            for (var i = 0; i < conditions.length; i++) {
                str += sep;
                str += conditions[i];
                if (i + 2 == conditions.length) {
                    sep = " and ";
                }
                else {
                    sep = ", ";
                }
            }

            console.log(str);
        }
        else {
            console.log("Elevator Doors are closed :)");
        }
    }

};
setInterval(function () {

    elevator.changeState();
    elevator.displayState();

}, 5000);

emitter.on("doorsOpen", function () {
    elevator.openDoor(function (err) {
        if (err) {
            console.error(err);
        }
    });
});

emitter.on("passengersgetson", function () {
    elevator.closeDoor(function (err) {
        if (err) {
            console.error(err);
        }
    });
});
/*
emitter.on("babyWet", function () {
    baby.change(function (err) {
        if (err) {
            console.error(err);
        }
    });
});

emitter.on("babyGassy", function () {
    baby.burp(function (err) {
        if (err) {
            console.error(err);
        }
    });
});

emitter.once('babyGassy', function () {
    baby.makeHungry();
});

emitter.once("babyHungry", function () {
    baby.makeGassy();
});*/
