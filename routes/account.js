const express = require('express');
const database = require('../database');
const router = express.Router();
const crypto = require('crypto');

router.get('/', (req, res) => {
    database.query(`select name, last_name1 as lastName1, last_name2 as lastName2, birth_date as birthDate, gender, email, json_object("street", street, "number", number, "interiorNumber", interior_number, "neighborhood", neighborhood, "zipCode", zip_code, "phone", phone) as "address" from user join address on id_shipping_address = id_address and id_user = ${req.session.id_user}`, (err, result) => {
        result = result.map(row => (row.address = JSON.parse(row.address), row));
        res.status(200).json(result[0]);
    });
});

router.post('/login', (req, res) => {
    const hash = crypto.createHash('sha256').update(req.body['password']).digest('hex');
    database.query(`SELECT id_user, account_type FROM user where email = '${req.body['email']}' and password = '${hash}'`, (err, result) => {
        if (err) throw err;
        if (result.length === 1) {
            var employee = result[0].account_type === 0;
            req.session.employee = employee;
            req.session.id_user = result[0].id_user;
            res.status(200).json({
                "logged_in": "true",
                "employee": `${employee}`,
                "id_user": `${result[0].id_user}`
            });
        }
        else if (result.length === 0) {
            res.status(200).json({
                "logged_in": "false",
                "employee": "false",
                "id_user": "-1"
            });
        }
        else {
            res.status(200).json({
                "logged_in": "false",
                "employee": "false",
                "id_user": "-2"
            });
        }
    });
});

router.get('/logout', (req, res) => {
    req.session = null;
    res.status(200).json({
        "logged_in": "false",
        "employee": "false",
        "id_user": "-1"
    });
});

router.get('/logged', (req, res) => {
    if (req.session.id_user) {
        res.status(200).json({
            "logged_in": "true",
            "employee": `${req.session.employee}`,
            "id_user": `${req.session.id_user}`
        });
    }    
    else {
        res.status(200).json({
            "logged_in": "false",
            "employee": "false",
            "id_user": "-1"
        });
    }
});

module.exports = router;