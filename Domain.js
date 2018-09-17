** DOMAIN EXAMPLE **

var EventEmitter = require("events").EventEmitter;
var domain = require('domain');

var myDomain = domain.create();

var emitter = new EventEmitter();

myDomain.add(emitter);

myDomain.on('error', function(err) {
    console.error("My domain handled this error");
});

var whatIWantToDo = function() {
    setInterval(function() {
        console.log("here I am");
    }, 500);   
};

myDomain.run(function() {
    
    whatIWantToDo();
    
    setInterval(function() {
        emitter.emit("error", new Error("This is an error"));
    }, 1500);   
});

** PATH EXAMPLE **

var path = require('path');
var fs = require('fs');

var fileName = path.join(__dirname, 'data', 'txt.html');

var data = fs.readFileSync(fileName);

console.log(fileName);

** PATH EXAMPLE 2 **

var path = require('path');
var http = require("http");

http.createServer(function (request, response) {
    // Send the HTTP header 
    // HTTP Status: 200 : OK
    // Content Type: text/plain
    response.writeHead(200, {'Content-Type': 'text/html'});

    var methods = ['tmpdir', 'endianness', 'hostname', 'type', 'platform', 'arch', 'release', 
        'uptime', 'loadavg', 'totalmem', 'freemem', 'cpus', 'networkInterfaces'];

    var props = ['EOL'];

    var html = "<html>" + 
               "<body>" +
               "<h1>Path Properties</h1>" +
               "<dl>";

    for (var p in path)
    {
        html += "<dt>" + p + "</dt>";
        html += "<dd>" + path[p] + "</dd>";
    }    

    html += "</dl></body></html>";

    response.end(html + "\n");


}).listen(8080);

// Console will print the message
console.log('Server running at http://127.0.0.1:8080/');

** OS EXAMPLE **

var os = require('os');
var http = require("http");

http.createServer(function (request, response) {
    // Send the HTTP header 
    // HTTP Status: 200 : OK
    // Content Type: text/plain
    response.writeHead(200, {'Content-Type': 'text/html'});

    var methods = ['tmpdir', 'endianness', 'hostname', 'type', 'platform', 'arch', 'release', 
        'uptime', 'loadavg', 'totalmem', 'freemem', 'cpus', 'networkInterfaces'];

    var props = ['EOL'];

    var html = "<html>" + 
               "<body>" +
               "<h1>OS Methods</h1>" +
               "<dl>";

    for (var i = 0; i < methods.length; i++)
    {
        html += "<dt>" + methods[i] + "</dt>";
        html += "<dd>" + os[methods[i]]() + "</dd>";
    }

    html += "</dl>" +
            "<h1>OS Properties</h1>" +
            "<dl>";

    for (var i = 0; i < props.length; i++)
    {
        html += "<dt>" + props[i] + "</dt>";
        html += "<dd>" + os[props[i]] + "</dd>";
    }

    html += "</dl></body></html>";

    response.end(html + os.EOL);


}).listen(8080);

// Console will print the message
console.log('Server running at http://127.0.0.1:8080/');
