# 🌍 World Disaster Database Project

## 📖 Overview
This project, part of the Database course at Aristotle University of Thessaloniki, involves the design and implementation of a relational database system named **World Disaster Database (WorldDisasterDB)**. The database collects, organizes, and presents critical data related to global disasters, offering insights for decision-making, research, and disaster response planning.

The project is structured in multiple phases, including conceptual design, relational schema creation, SQL implementation, and testing using example queries.

---

## 🎯 Goals

- **📊 Data Collection and Organization**: Efficiently collect and classify information on global disasters to support analysis and decision-making.
- **🌟 Insights and Analysis**: Enable users to understand disaster impacts and develop preventive measures.
- **🔗 Multi-Purpose Usability**: Serve various user groups such as citizens, researchers, and governmental bodies with tailored access.
- **📋 Comprehensive Design**: Implement a well-structured database with entity-relationship diagrams, relational schemas, and SQL queries for practical applications.

---

## ✨ Features

- **Entity-Relationship Model**:
  - Detailed modeling of disasters, including natural and human-caused events.
  - Entities like affected countries, victims, donation centers, NGOs, media articles, and more.
- **Relational Schema**:
  - Well-defined relationships between entities to ensure data consistency and efficient query execution.
- **User Categorization**:
  - Differentiated access levels for administrators, researchers, governments, and citizens.
- **SQL Query Implementation**:
  - Example queries for retrieving disaster data, analyzing impacts, and visualizing results.

---

## 🛠️ Techniques Utilized

- **Entity-Relationship Diagrams**: Used for conceptual design to represent entities, attributes, and relationships.
- **Normalization**: Ensured database normalization to avoid redundancy and maintain consistency.
- **SQL**: Wrote and executed complex SQL queries for data retrieval and analysis.
- **Data Validation**: Ensured data accuracy with integrity constraints and foreign keys.
- **Multi-User Access**: Implemented user roles and permissions for tailored access.

---

## 🏆 Results

- **Structured Data Representation**:
  - A well-organized database system capable of storing extensive disaster-related data.
- **Successful Query Execution**:
  - Provided meaningful insights into disaster management through SQL queries.
- **User-Friendly Access**:
  - Simplified access for diverse user categories, enabling efficient usage and analysis.

---

## 📂 Repository Contents

- **📄 Report**: Comprehensive documentation of the project in [World Disaster Database Report](./World_Disaster_DB_29.pdf).
- **💻 Code**: SQL scripts and schema definitions for database implementation.

---

## CrisisMapper

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


---

## 🤝 Contributors
- [Panagiotis Karvounaris](https://github.com/karvounaris)
- [Iasonas Kakandris](https://github.com/deepblue597)
- [Iliana Kogia](https://github.com/IlianaKog)

---

Thank you for checking out this project! 🌟 Feel free to raise issues or contribute to improve the repository. 😊

