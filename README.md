# CrisisMapper

CrisisMapper is a comprehensive world disasters app designed to provide real-time insights, analysis, and tracking of global disasters. Our platform offers a centralized hub for accessing critical information 
related to natural and human-made disasters, fostering global awareness and facilitating rapid response efforts.

This is a complete application that includes 
- a database called **world disasters**
- a backend-server called **server.js**
- a frontend app in **Angular**

## Run the programm 

In order to run the program : 
1. Open the MySQL workbench and run the file `create-all-database.sql`. This will create your database
2. Open the folder and type on cmd `npm install`
3. Go to the server.js files and change the user and password to your user (usually root) and password that you have to enter in your database
   ` const pool = mysql.createPool({
	host: "localhost",
	user: "YOURUSERNAME",
	password: "YOURPASSWORD",
	database: "world_disasters",
	waitForConnections: true,
	connectionLimit: 10,
	queueLimit: 0,
});
`
5. Run `node server.js`. This will open the backend-server in `port 3000` . Notice: Change the password of the root user with the password you have in your MySQL workbench.
6. Go to `frontend/frontend-app` folder and run `ng serve --open`. This will open the frontend application that you can use to make the requests to the database.
