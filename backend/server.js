// simplecode-api/server.js
// Include express
const express = require('express');
require('dotenv').config();
const app = express(); // Include body-parser
const bodyParser = require('body-parser');
const tokenExpiry = require('./utilities/tokenExpiry');

// Include users.js file from the api directory
const userRoutes = require('./api/new/users');
const { Server } = require('http');

app.use(bodyParser.json());

app.use('/v1/users', userRoutes);

const port = process.env.PORT;

// express returns an HTTP server
app.listen(port, () => console.log(`[Server] online ${new Date()} at Port = ${port} `));
