// simeplcode-api/api/routes/users.js
// Include express
const express = require("express");
const router = express.Router();
const bcrypt = require("bcryptjs");
const crypto = require("crypto");
const jwt = require("jsonwebtoken");
const database = require("../../database");
const sendEmail = require("../../utilities/sendEmail");
// Validation
const checkRegistrationFields = require("../../valid/register");
const key = require("../../utilities/keys")
// Login validation
const validateLoginInput = require("../../validation/login");const key = require("../../utilities/keys")
// Login validation
const validateLoginInput = require("../../validation/login");
// Resend email validaiton
const checkResendField = require("../../valid/resend");

//validation
const checkRegistrationFields = require("../../valid/register");

//Register route
router.post("/register", (req, res)=>{

  const{errors, isValid} = checkRegistrationFields(req.body);

    if(!isValid){
      return res.status(400).json(errors);
    }
  let token;
  crypto.randomBytes(48, (err, buf) =>{
    if(err)throw err;
    token = buf
    .toString("base64")
     .replace(/\//g, "")
     .replace(/\+/g, "-");
     return token;  
  });

  bcrypt.genSalt(12, (err, salt) => {
    if (err) throw err;
    bcrypt.hash(req.body.password1, salt, (err, hash) => {
      if (err) throw err;
      database("users")
        .returning(["id", "email", "registered", "token"])
        .insert({
          email: req.body.email,
          password: hash,
          registered: Date.now(),
          token: token,
          createdtime: Date.now(),
          emailverified: "f",
          tokenusedbefore: "f"
        })
        .then(user => {
          res.json(user[0]);
        })
        .catch(err => {
          errors.account = "Email already registered";
          res.status(400).json(errors);
        });
    });
  });
});

router.post("/verify/:token", (req, res) => {
  const { token } = req.params;
  const errors = {};

  database
    .returning(["email", "emailverified", "tokenusedbefore"])
    .from("users")
    .where({ token: token, tokenusedbefore: "f" })
    .update({ emailverified: "t", tokenusedbefore: "t" })
    .then(data => {
      if (data.length > 0) {
        res.json(
          "Email verified! Please login to access your account"
        );
      } 

      else {
        database
          .select("email", "emailverified", "tokenusedbefore")
          .from("users")
          .where("token", token)
          .then(check => {
            if (check.length > 0) {
              if (check[0].emailverified) {
                errors.alreadyVerified =
                  "Email already verified. Please login to your account.";
                res.status(400).json(errors);
              }
            } else { 
              errors.email_invalid =
                "Email invalid. Please check if you have registered with the 
                correct email address or re-send the verification link to your 
                  email.";
              res.status(400).json(errors);
            }
          })
          .catch(err => {
            errors.db = "Bad request";
            res.status(400).json(errors);
          });
      }
    })
    .catch(err => {
      errors.db = "Bad request";
      res.status(400).json(errors);
    });
});
router.post("/resend_email", (req, res) => {

  const { errors, isValid } = checkResendField(req.body);

  if (!isValid) {
    return res.status(400).json(errors);
  }

  let resendToken;
  crypto.randomBytes(48, (err, buf) => {
    if (err) throw err;
    resendToken = buf
      .toString("base64")
      .replace(/\//g, "")
      .replace(/\+/g, "-");
    return resendToken;
  });
  database
  .table("users")
  .select("*")
  .where({ email: req.body.email })
  .then(data => {
    if (data.length == 0) {
      errors.invalid = "Invalid email address. Please register again!";
      res.status(400).json(errors);
    } else {
      database
        .table("users")
        .returning(["email", "token"])
        .where({ email: data[0].email, emailverified: "false" })
        .update({ token: resendToken, createdtime: Date.now() })
        .then(result => {
          if (result.length) {
            let to = [result[0].email];

            let link =
              "https://yourWebsite/v1/users/verify/" + result[0].token;

            let sub = "Confirm Registration";

            let content =
              "<body><p>Please verify your email.</p> <a href=" +
              link +
              ">Verify email</a></body>";
            sendEmail.Email(to, sub, content);

            res.json("Email re-sent!");
          } else {
            errors.alreadyVerified =
              "Email address has already been verified, please login.";
            res.status(400).json(errors);
          }
        })
        .catch(err => {
          errors.db = "Bad request";
          res.status(400).json(errors);
        });
    }
  })
  .catch(err => {
    errors.db = "Bad request";
    res.status(400).json(errors);
  });
});

router.post("/login", (req, res) => {
  // Ensures that all entries by the user are valid
    const { errors, isValid } = validateLoginInput(req.body);
  
    if (!isValid) {
      return res.status(400).json(errors);
    } else {
      database
    .select("id", "email", "password")
    .where("email", "=", req.body.email)
    .andWhere("emailverified", true)
    .from("users")
    .then(data => {
      bcrypt.compare(req.body.password, data[0].password).then(isMatch => {
        if (isMatch) {
          const payload = { id: data[0].id, email: data[0].email };
          jwt.sign(
            payload,
            key.secretOrKey,
            { expiresIn: 3600 },
            (err, token) => {
              res.status(200).json("Bearer " + token)
            })
          } else {
            res.status(400).json("Bad request")
          }
        })})
        .catch(err => {
          res.status(400).json("Bad request")
        })
  }
});





// Exports the router object
module.exports = router;