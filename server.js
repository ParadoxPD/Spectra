// simplecode-api/server.js
// Include express
const express = require("express");

// This line simply puts Express in a variable called 'app'
const app = express(); // Include body-parser
const bodyParser = require("body-parser");

// Include users.js file from the api directory (We will add this in the next step)
const userRoutes = require("./api/new/users");

// Configure body-parser settings//
// urlencoded is for bodies that have UTF-8 encoding.
// If {extended: false} you cannot use nested objects.
// e.g. nested obj = {person:{name: adam}}
app.use(bodyParser.urlencoded({ extended: true }));

// Parse json with body-parser


// Setup your api routes with express
app.use("/v1/users", userRoutes);

// Server will listen to whatever is in the environment variable 'port'
// or 3000 if nothing is specified
const port = process.env.PORT ||5001;

// express returns an HTTP server
app.listen(port, () => console.log("[Server] online " + new Date()));