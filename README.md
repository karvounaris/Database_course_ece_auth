# Database_course

This is a complete application that includes 
- a database called **world disasters**
- a backend-server called **server.js**
- a frontend app in **Angular**

## Run the programm 

In order to run the program : 
1. Open the MySQL workbench and run the file `create-all-database.sql`. This will create your database
2. Open the folder and run `node server.js`. This will open the backend-server in `port 3000` . Notice: Change the password of the root user with the password you have in your MySQL workbench.
3. Go to `frontend/frontend-app` and run `ng serve --open`. This will open the frontend application that you can use to make the requests to the database 
