const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
    res.send('Sushin\' Gada\'s Back-End');
});

module.exports = router;