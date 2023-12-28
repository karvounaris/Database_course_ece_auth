const express = require("express");
const mysql = require("mysql2/promise");
const cors = require("cors");

const app = express();
const port = 3000;

app.use(cors()); // Add this line to enable CORS for all routes
app.use(express.json());

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

app.post("/country", async (req, res) => {
	console.log(req.body);
	try {
		const { country_name, population, GDP } = req.body;
		// Validate input if needed

		const result = await pool.query(
			"INSERT INTO Country (country_name , population, GDP ) VALUES (?, ?, ?)",
			[country_name, population, GDP]
		);

		res.json({ success: true, message: "Country created successfully" });
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal Server Error" });
	}
});

app.post("/disasters", async (req, res) => {
	try {
		// Extract disaster data from req.body and validate input if needed

		const result = await pool.query(
			"INSERT INTO disaster (Disaster_name, start_date, stop_date, deaths, injured, missing, air_quality, water_quality, Continent, center_latitude, center_longitude, radius, type, Base_location) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
			[
				Disaster_name,
				start_date,
				stop_date,
				deaths,
				injured,
				missing,
				air_quality,
				water_quality,
				Continent,
				center_latitude,
				center_longitude,
				radius,
				type,
				Base_location,
			]
		);

		res.json({ success: true, message: "Disaster created successfully" });
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal Server Error" });
	}
});

app.post("/person", async (req, res) => {
	try {
		// Extract person data from req.body and validate input if needed

		const result = await pool.query(
			"INSERT INTO Person (age, person_name, person_surname, gender, nationality, status) VALUES (?, ?, ?, ?, ?, ?)",
			[age, person_name, person_surname, gender, nationality, status]
		);

		res.json({ success: true, message: "Person created successfully" });
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal Server Error" });
	}
});

app.post("/media_article", async (req, res) => {
	try {
		// Extract media article data from req.body and validate input if needed

		const result = await pool.query(
			"INSERT INTO Media_article (title, author, media_type, publication_date, origin_country, disaster_id) VALUES (?, ?, ?, ?, ?, ?)",
			[title, author, media_type, publication_date, origin_country, disaster_id]
		);

		res.json({ success: true, message: "Media article created successfully" });
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal Server Error" });
	}
});

app.delete("/disasters/:id", async (req, res) => {
	const disasterId = req.params.id;
	try {
		const result = await pool.query(
			"DELETE FROM disaster WHERE Disaster_ID = ?",
			[disasterId]
		);
		res.status(200).json({ message: "Disaster deleted successfully" });
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal Server Error" });
	}
});

app.delete("/country/:name", async (req, res) => {
	const countryName = req.params.name;
	try {
		const result = await pool.query(
			"DELETE FROM Country WHERE country_name = ?",
			[countryName]
		);
		res.status(200).json({ message: "Country deleted successfully" });
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal Server Error" });
	}
});

app.delete("/person/:id", async (req, res) => {
	const personId = req.params.id;
	try {
		const result = await pool.query("DELETE FROM Person WHERE person_id = ?", [
			personId,
		]);
		res.status(200).json({ message: "Person deleted successfully" });
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal Server Error" });
	}
});

app.delete("/media_articles/:title/:author", async (req, res) => {
	const title = req.params.title;
	const author = req.params.author;
	try {
		const result = await pool.query(
			"DELETE FROM Media_article WHERE title = ? AND author = ?",
			[title, author]
		);
		res.status(200).json({ message: "Media article deleted successfully" });
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal Server Error" });
	}
});

// Add more routes for other entities as needed

app.listen(port, () => {
	console.log(`Server is running on port ${port}`);
});
