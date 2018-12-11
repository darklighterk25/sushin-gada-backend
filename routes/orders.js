const express = require('express');
const database = require('../database');
const router = express.Router();
const simplify = require('simplify-commerce');
const shell = require('shelljs');

router.get('/', (req, res) => {
    if (req.session.id_user) {
        database.query(`select id, closed, delivered, date, discount, taxes, total, items from orders_view where closed = 1 and id_user = ${req.session.id_user}`, (err, result) => {
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
                shell.exec(`sudo ./send_sms.sh "${req.body['phone']}" "${msg}"`);
                if (data.paymentStatus === "DECLINED") {
                    res.status(401).json(data);
                } else {
                    database.query(`update purchase set closed = 1 where id_user = ${req.session.id_user}`, (err) => {
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