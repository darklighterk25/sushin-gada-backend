const express = require('express');
const database = require('../database');
const router = express.Router();

router.get('/', (req, res) => {
    database.query('SELECT * FROM menu_view', (err, result) => {
        if (err) throw err;
        res.status(200).json(result);
    });
});

router.put('/addToCart', (req, res) => {
    if (req.session.id_user) {
        database.query(`call add_to_cart(
                            ${req.session.id_user},
                            ${req.body['idItem']},
                            ${req.body['quantity']},
                            ${req.body['price']}
                        )`, (err, result) => {
            if (err) throw err;
            res.status(200).json({
                "status": 200
            });
        });
    } else {
        res.status(401).json({
            "status": 401
        });
    }
});

module.exports = router;