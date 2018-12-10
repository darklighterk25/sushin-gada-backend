const express = require('express');
const database = require('../database');
const router = express.Router();
const simplify = require("simplify-commerce");
const shell = require("shelljs");

router.get('/', (req, res) => {
    res.status(200).json(
        [{
                "id": "2085",
                "date": new Date('August 25, 2018 14:24:00'),
                "items": [{
                        "name": "Mango Avocado Uramaki",
                        "type": "dish",
                        "description": "Uramaki de mango y aguacate",
                        "picture": "https://imgur.com/IAT5GKx.jpg",
                        "quantity": 1,
                        "price": 100
                    },
                    {
                        "name": "Beluman",
                        "type": "dish",
                        "description": "Salmón por fuera, pasta maki, camarón y philadelphia por dentro.",
                        "picture": "https://imgur.com/xmiamfS.jpg",
                        "quantity": 1,
                        "price": 129
                    }
                ],
                "total": 229
            },
            {
                "id": "6574",
                "date": new Date('August 12, 2018 15:05:55'),
                "items": [{
                    "name": "Unagui",
                    "type": "dish",
                    "description": "Rollo de alga, salmón y anguila.",
                    "picture": "https://imgur.com/oogRI5R.jpg",
                    "quantity": 1,
                    "price": 120
                }],
                "total": 120
            },
        ]
    );
});

router.put('/purchase', (req, res) => {
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
            res.status(401).json({
                "status": 401,
                "message": `${errData.data.error.message}`
            });
        } else {
            var msg = `Ha realizado una compra en Sushin\' Gada por $ ${req.body['amount']/100} MXN`
            shell.exec(`sudo ./send_sms.sh "${req.body['phone']}" "${msg}"`);
            res.status(200).json(data);
        }
    });
});

module.exports = router;