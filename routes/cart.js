const express = require('express');
const database = require('../database');
const router = express.Router();

router.get('/', (req, res) => {
    if (req.session.id_user) {
        database.query(`select id, closed, delivered, date, discount, taxes, total, items from cart_view where id_user = ${req.session.id_user}`, (err, result) => {
            result = result.map(row => (row.items = JSON.parse(row.items), row));
            res.status(200).json(result[0]);
        });
    } else {
        res.status(401).json({
            "status": 401
        });
    }
});

router.put('/add-item', (req, res) => {
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

router.delete('/delete', (req, res) => {
    res.status(200).json(
        {
            "status": 200
        }
    );
});

module.exports = router;