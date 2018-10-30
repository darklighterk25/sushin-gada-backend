const express = require('express');
const database = require('../database');
const router = express.Router();

router.get('/', (req, res) => {
    database.query(`select * from locations_view;`, (err, result) => {
        if (err) throw err;
        result = result.map(row => (row.address = JSON.parse(row.address), row));
        result = result.map(row => (row.coordinates = JSON.parse(row.coordinates), row));
        res.status(200).json(result);
    });
});

module.exports = router;