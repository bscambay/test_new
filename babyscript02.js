var events = require("events");

var emitter = new events.EventEmitter();

var baby = {

    // The baby's state:
    tired: false,
    hungry: false,
    gassy: false,
    wet: false,

    // Methods to take care of the baby
    feed: function(callback) {
        if (this.hungry) {
            this.hungry = false;
            console.log("You fed the baby");
            callback(undefined);
        }
        else {
            callback("The baby's not hungry!");
        }
    },

    change: function(callback) {
        if (this.wet) {
            this.wet = false;
            console.log("You changed the baby");
            callback(undefined);
        }
        else {
            callback("The baby's not wet!");
        }
    },

    burp: function(callback) {
        if (this.gassy) {
            this.gassy = false;
            console.log("You burped the baby");
            callback(undefined);
        }
        else {
            callback("The baby's not gassy!");
        }
    },

    layDown: function(callback) {
        if (this.tired) {
            this.tired = false;
            console.log("You gave the baby a nap");
            callback(undefined);
        }
        else
        {
            callback("The baby's not tired!");
        }
    },

    // Other Methods

    makeHungry: function() {
        this.hungry = true;
        emitter.emit("babyHungry");
    },

    makeGassy: function() {
        this.gassy = true;
        emitter.emit("babyGassy");
    },

    changeState: function() {

        var rnd = Math.ceil(Math.random() * 4);

        switch (rnd)
        {
            case 1:
                this.makeHungry(); 
                break;
            case 2:
                this.tired = true;
                emitter.emit("babyTired");
                break;
            case 3: 
                this.wet = true;
                emitter.emit("babyWet");
                break;
            case 4: 
                this.makeGassy();
                break;
            default: 
                break;
        }
    },

    displayState: function() {
        var conditions = [];

        if (this.hungry) conditions.push("hungry");
        if (this.tired) conditions.push("tired");
        if (this.wet) conditions.push("wet");
        if (this.gassy) conditions.push("gassy");

        if (conditions.length)
        {
            var str = "The baby is ";
            var sep = "";

            for (var i = 0; i < conditions.length; i++) 
            {
                str += sep;
                str += conditions[i];
                if (i + 2 == conditions.length)
                {
                    sep = " and ";
                }
                else 
                {
                    sep = ", ";
                }
            }

            console.log(str);
        }
        else
        {
            console.log("The baby is happy :)");
        }
    }

};

setInterval(function() {

    baby.changeState();
    baby.displayState();

}, 5000);

emitter.on("babyHungry", function() {
    baby.feed(function(err) {
        if (err)
        {
            console.error(err);
        }
    });
});

emitter.on("babyTired", function() {
    baby.layDown(function(err) {
        if (err)
        {
            console.error(err);
        }
    });
});

emitter.on("babyWet", function() {
    baby.change(function(err) {
        if (err)
        {
            console.error(err);
        }
    });
});

emitter.on("babyGassy", function() {
    baby.burp(function(err) {
        if (err)
        {
            console.error(err);
        }
    });
});

emitter.once('babyGassy', function() {
    baby.makeHungry();
});

emitter.once("babyHungry", function() {
    baby.makeGassy();
});
