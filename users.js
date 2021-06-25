// simeplcode-api/api/routes/users.js
// Include express
const express = require("express");

// Include express router middleware
const router = express.Router();

// Add a 'get' method to express router for our test route
router.get("/", function(req, res) {
  res.send({ msg: "Hello World" });
});

// Exports the router object
module.exports = router;