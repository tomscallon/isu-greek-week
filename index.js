var app = require("./server/app"),
    express = require("express");

// Determine the port to bind to (process.env.PORT is for Heroku)
app.set('port', ( process.env.PORT || 5000 ));

// Save the top directory
app.set('dir', __dirname );

// On empty url, return the main file
app.get("/", function( req, res ) {
  res.sendFile( __dirname + "/webapp/index.htm" );
});

// Server gw2016.css statically
app.get("/gw2016.css", function( req, res ) {
  res.sendFile( __dirname + "/webapp/gw2016.css" );
});

// Serve files for paths under image/ or js/
app.use("/image", express.static( __dirname + "/webapp/image" ));
app.use("/js",    express.static( __dirname + "/webapp/js" ));

// Placeholder response -- just echo the path for now
app.use(function( req, res ) {
  res.send("You requested the path \"<strong>" + req.url + "</strong>\"");
});

// Listen on the designated port
app.listen(app.get('port'), function() {
  console.log("Node app is running at localhost:" + app.get('port'));
});