const express = require('express');
const router = express.Router();
const bcrypt = require('bcryptjs');
const crypto = require('crypto');
const database = require('../../database');

const checkRegistrationFields = require('../../validation/register');

const validateLoginInput = require('../../validation/login');

router.post('/register', (req, res) => {
	const { errors, isValid } = checkRegistrationFields(req.body);

	if (!isValid) {
		return res.status(400).json(errors);
	}
	let token;
	crypto.randomBytes(48, (err, buf) => {
		if (err) throw err;
		token = buf.toString('base64').replace(/\//g, '').replace(/\+/g, '-');
		return token;
	});

	bcrypt.genSalt(12, (err, salt) => {
		if (err) throw err;
		bcrypt.hash(req.body.password1, salt, (error, hash) => {
			if (error) throw err;
			database('users')
				.returning([ 'id', 'email', 'token', 'fullname' ])
				.insert({
					email: req.body.email,
					password: hash,
					registered: Date.now(),
					token: token,
					createdtime: Date.now(),
					usertype: req.body.type,
					fullname: req.body.fullname
				})
				.then((user) => {
					console.log(user[0]);
					res.json(user[0]);
				})
				.catch((err) => {
					console.log(err);
					errors.account = 'Email already registered';
					res.status(400).json(errors);
				});
		});
	});
});

router.post('/login', (req, res) => {
	const token = req.headers.token;

	if (token) {
		database('users')
			.select('id', 'email', 'fullname', 'token')
			.where({ token: token })
			.then((user) => {
				user = user[0];
				let resData;
				resData = { id: user['id'], email: user['email'], fullname: user['fullname'], type: user['usertype'] };

				res.status(200).json(resData);
			})
			.catch((err) => {
				res.status(400).json('Bad request');
			});
	} else {
		console.log(req.body);
		const { errors, isValid } = validateLoginInput(req.body);

		if (!isValid) {
			return res.status(400).json(errors);
		} else {
			database
				.from('users')
				.select('id', 'email', 'password', 'token', 'fullname', 'usertype')
				.where('email', '=', req.body.email)
				.then((data) => {
					bcrypt.compare(req.body.password, data[0].password).then((isMatch) => {
						if (isMatch) {
							const payload = {
								id: data[0].id,
								email: data[0].email,
								fullname: data[0].fullname,
								token: data[0].token,
								type: data[0].usertype
							};
							res.status(200).json(payload);
						} else {
							res.status(400).json('Bad request');
						}
					});
				})
				.catch((err) => {
					res.status(400).json('Bad request');
				});
		}
	}
});

module.exports = router;
