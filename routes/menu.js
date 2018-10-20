const express = require('express');
const database = require('../database');
const router = express.Router();

router.get('/', (req, res) => {
    database.query('SELECT * FROM menu', (err, result) => {
        if (err) throw err;
        res.status(200).json(result);
    });
});

module.exports = router;