// simplecode-api/server.js
// Include express
const express = require("express");

const app = express(); // Include body-parser
const bodyParser = require("body-parser");
const tokenExpiry = require("./utilities/tokenExpiry");

// Include users.js file from the api directory
const userRoutes = require("./api/new/users");
const { Server } = require("http");

app.use(bodyParser.urlencoded({ extended: true }));

app.use("/v1/users", userRoutes);

const port = process.env.PORT ||5001;

// express returns an HTTP server
app.listen(port, () => console.log("[Server] online " + new Date()));