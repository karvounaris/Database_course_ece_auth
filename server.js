const express = require("express");
const mysql = require("mysql2/promise");

const app = express();
const port = 3000;

const pool = mysql.createPool({
	host: "localhost",
	user: "root",
	password: "e3p3Edy@&IV%TM9q",
	database: "world_disasters",
	waitForConnections: true,
	connectionLimit: 10,
	queueLimit: 0,
});

// Disaster entity
app.get("/disasters", async (req, res) => {
	try {
		const [rows] = await pool.query("SELECT * FROM disaster");
		res.json(rows);
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal Server Error" });
	}
});

// Human Disaster entity
app.get("/human_disasters", async (req, res) => {
	try {
		const [rows] = await pool.query("SELECT * FROM human_disaster");
		res.json(rows);
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal Server Error" });
	}
});

// Natural Disaster entity
app.get("/natural_disasters", async (req, res) => {
	try {
		const [rows] = await pool.query("SELECT * FROM Natural_Disaster");
		res.json(rows);
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal Server Error" });
	}
});

app.get("/media_article", async (req, res) => {
	try {
		const [rows] = await pool.query("SELECT * FROM Media_article");
		res.json(rows);
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal Server Error" });
	}
});

app.get("/person", async (req, res) => {
	try {
		const [rows] = await pool.query("SELECT * FROM Person");
		res.json(rows);
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal Server Error" });
	}
});

app.get("/country", async (req, res) => {
	try {
		const [rows] = await pool.query("SELECT * FROM Country");
		res.json(rows);
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal Server Error" });
	}
});

app.get("/disaster_situation", async (req, res) => {
	try {
		const [rows] = await pool.query("SELECT * FROM disaster_situation");
		res.json(rows);
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal Server Error" });
	}
});

app.get("/ngo", async (req, res) => {
	try {
		const [rows] = await pool.query("SELECT * FROM NGO");
		res.json(rows);
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal Server Error" });
	}
});

app.get("/national_emergency_agency", async (req, res) => {
	try {
		const [rows] = await pool.query("SELECT * FROM National_Emergency_Agency");
		res.json(rows);
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal Server Error" });
	}
});

app.get("/disease", async (req, res) => {
	try {
		const [rows] = await pool.query("SELECT * FROM Disease");
		res.json(rows);
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal Server Error" });
	}
});

app.get("/building", async (req, res) => {
	try {
		const [rows] = await pool.query("SELECT * FROM Building");
		res.json(rows);
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal Server Error" });
	}
});

app.get("/donation_center", async (req, res) => {
	try {
		const [rows] = await pool.query("SELECT * FROM Donation_Center");
		res.json(rows);
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal Server Error" });
	}
});

// Add more routes for other entities as needed

app.listen(port, () => {
	console.log(`Server is running on port ${port}`);
});
