const knex = require('knex');

const database = knex({
	client: 'pg', // pg is the database library for postgreSQL on knexjs
	connection: {
		host: '127.0.0.1', // Your local host IP
		user: 'paradox', // Your postgres user name
		password: '8013', // Your postgres user password
		database: 'reg_table' // Your database name
	}
});

module.exports = database;
