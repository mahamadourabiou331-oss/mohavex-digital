const express = require('express');
const mysql = require('mysql2');
require('dotenv').config();

const app = express();
app.use(express.json());

const db = mysql.createConnection({
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD || '',
    database: process.env.DB_NAME || 'mohavex_db'
});

db.connect(err => {
    if (err) {
        console.error('Kuskuren haɗawa da MySQL:', err);
    } else {
        console.log('An haɗa da rumbun bayanai na MOHAVEX MySQL cikin nasara.');
    }
});

app.get('/api/status', (req, res) => {
    res.json({ status: 'success', message: 'MOHAVEX.DIGITAL API tana aiki cikin nasara.' });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Uwar garken tana aiki akan tashar ${PORT}`);
});
