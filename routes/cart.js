const express = require('express');
const database = require('../database');
const router = express.Router();

router.get('/', (req, res) => {
    if (req.session.id_user) {
        database.query(`select id, closed, date, discount, taxes, total, items from orders_view where closed = 0 and id_user = ${req.session.id_user}`, (err, result) => {
            if (err) throw err;
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
    if (req.session.id_user) {
        database.query(`call delete_cart(${req.session.id_user})`, err => {
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