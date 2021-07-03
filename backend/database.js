const knex = require('knex');

const database = knex({
	client: 'pg', // pg is the database library for postgreSQL on knexjs
	connection: {
		host: process.env.DATABASE_HOST, // Your local host IP
		user: process.env.DATABASE_USER, // Your postgres user name
		password: process.env.DATABASE_USER_PASSWORD, // Your postgres user password
		database: process.env.DATABASE_USER_NAME // Your database name
	}
});

module.exports = database;
