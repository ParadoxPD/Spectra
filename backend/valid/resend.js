const Validator = require("validator");
const ifEmpty = require("./checkForEmpty");

module.exports = function checkResendField(data) {
  let errors = {};

  data.email = !ifEmpty(data.email) ? data.email : "";

  if (Validator.isEmpty(data.email)) {
    errors.email = "Email is required";
  }
  if (!Validator.isEmail(data.email)) {
    errors.email = "Email address is invalid";
  }

  return {
    errors,
    isValid: ifEmpty(errors)
  };
};