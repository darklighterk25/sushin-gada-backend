const express = require('express');
const database = require('../database');
const router = express.Router();
const simplify = require('simplify-commerce');
const shell = require('shelljs');

router.get('/', (req, res) => {
    if (req.session.id_user) {
        database.query(`select id, closed, date, discount, taxes, total, items from orders_view where closed = 1 and id_user = ${req.session.id_user}`, (err, result) => {
            if (err) throw err;
            result = result.map(row => (row.items = JSON.parse(row.items), row));
            res.status(200).json(result);
        });
    } else {
        console.log("estoy aquí :v")
        res.status(403).json({
            "status": 403
        });
    }
});

router.post('/promo-code', (req, res) => {
    database.query(`select id_discount, percentage from discount where now() between start and end and code = "${req.body['code']}"`, (err, result) => {
        if (err) throw err;
        if (result.length === 0) {
            res.status(403).json({
                "status": 403
            });
        } else {
            res.status(200).json(result[0]);
        }
    });
});

router.put('/purchase-in-branch', (req, res) => {
    if (req.session.id_user) {
        database.query(`call purchase_in_branch(${req.session.id_user}, ${req.body['idDiscount']})`, (err) => {
            if (err) throw err;
            res.status(200).json({
                "status": "200"
            });
        });
    }
});

router.put('/purchase', (req, res) => {
    if (req.session.id_user) {
        var client = simplify.getClient({
            publicKey: 'sbpb_MzI5MzYzMGQtMTg2YS00YTg1LWIxN2ItOTc5YzI2YmE4NzA4',
            privateKey: '7kzSZa+BU/e+k/CWw2TV09muK0t3Cgqv+EyO8rkQYIZ5YFFQL0ODSXAOkNtXTToq'
        });
        client.payment.create({
            amount: `${req.body['amount']}`,
            description: `${req.body['description']}`,
            card: {
                expMonth: `${req.body['card'].expMonth}`,
                expYear: `${req.body['card'].expYear}`,
                cvc: `${req.body['card'].cvc}`,
                number: `${req.body['card'].number}`
            }
        }, (errData, data) => {
            if (errData) {
                res.status(401).json(errData);
            } else {
                var msg = `Ha realizado una compra en Sushin\' Gada por $ ${req.body['amount']/100} MXN`
                shell.exec(`sudo ./send_sms.sh "${req.body['address'].phone}" "${msg}"`);
                if (data.paymentStatus === "DECLINED") {
                    res.status(401).json(data);
                } else {
                    const location = Math.round(Math.random() * 2 + 1);
                    var query = "";
                    if (req.body['address'].interiorNumber === undefined) {
                        query = `call close_purchase(${req.session.id_user}, ${location}, ${req.body['idDiscount']}, "${req.body['address'].street}",
                        "${req.body['address'].number}", null, "${req.body['address'].neighborhood}", "${req.body['address'].zipCode}",
                        "${req.body['address'].phone}")`;
                    } else {
                        query = `call close_purchase(${req.session.id_user}, ${location}, ${req.body['idDiscount']}, "${req.body['address'].street}",
                        "${req.body['address'].number}", "${req.body['address'].interiorNumber}", "${req.body['address'].neighborhood}", "${req.body['address'].zipCode}",
                        "${req.body['address'].phone}")`;
                    }
                    database.query(query, (err) => {
                        if (err) throw err;
                        res.status(200).json(data);
                    });
                }
            }
        });
    } else {
        res.status(403).json({
            "status": 403
        });
    }
});

module.exports = router;