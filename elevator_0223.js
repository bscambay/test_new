var events = require("events");
var emitter = new events.EventEmitter();

var elevator = {

    numberOfPassengers: 0,

    maxPassengers: 10,

    callElevator: function() {
        var rnd = Math.floor(Math.random() * 11);

        setTimeout(function() {
            
            setTimeout(function() {
                emitter.emit("doorClosed");
            }, 500);
            
            emitter.emit("doorOpen", rnd);

        }, rnd * 1000);
    },

    getOn: function(numPeople, callback) {

        if (this.numberOfPassengers + numPeople > this.maxPassengers)
        {
            callback(numPeople + " can't get on - it would exceed the maximum of " + this.maxPassengers + " people.");
        }
        else
        {
            this.numberOfPassengers += numPeople;
            callback(undefined, this.numberOfPassengers);
        }
    },

    getOff: function(numPeople, callback) {

        if (numPeople <= this.numberOfPassengers)
        {
            this.numberOfPassengers -= numPeople;
            callback(undefined, this.numberOfPassengers);
        }
        else
        {
            callback("There aren't " + numPeople + " passengers on the elevator.");
        }
    }

}

emitter.on("doorOpen", function(waitTime) {

    console.log("It took the elevator " + waitTime + " seconds to arrive");

    var waitTill = new Date(new Date().getTime + 4000);
    while (waitTill > new Date()) {}

    var rndOff = Math.ceil(Math.random() * 10);
    var rndOn = Math.ceil(Math.random() * 10);

    elevator.getOff(rndOff, function(err) {
        if (err) console.error(err);
    });

    elevator.getOn(rndOn, function(err) {
        if (err) console.error(err);
    });

});

emitter.on("doorClosed", function() {

    console.log("There are now " + elevator.numberOfPassengers + " people on the elevator.");
});

setInterval(function() {
    elevator.callElevator();
}, 2000);

/*
setInterval(function() {

    var rnd = Math.ceil(Math.random() * 10);

    elevator.getOn(rnd, function(err, numPassengers) {

        if (err)
        {
            console.error(err);
        }
        else
        {
            console.log("Successfully boarded " + rnd + " passengers.  Current # of passengers = " + numPassengers);
        }

    });

}, 4000);

setTimeout(function() {

    setInterval(function() {

        var rnd = Math.ceil(Math.random() * 10);

        elevator.getOff(rnd, function(err, numPassengers) {

            if (err)
            {
                console.error(err);
            }
            else
            {
                console.log("Successfully disembarked " + rnd + " passengers.  Current # of passengers = " + numPassengers);
            }

        });

    }, 4000);

}, 10000);
*/
