const express = require('express');
const database = require('../database');
const router = express.Router();
const crypto = require('crypto');

router.get('/', (req, res) => {
    res.status(200).json(
        {
            "name": "Rafael",
            "lastName1": "Valdéz",
            "lastName2": "Vallejo",
            "birthDate": "20-04-1969",
            "gender": "Male",
            "email": "usuario420@correo.com",
            "address": {
                "street": "Carranza",
                "number": "101",
                "neighborhood": "Colonia Centro",
                "zipCode": "20280",
            }
        }
    );
});

router.post('/login', (req, res) => {
    const hash = crypto.createHash('sha256')
        .update(req.body['password'])
        .digest('hex');
    database.query(`SELECT id_user, account_type FROM user where email = '${req.body['email']}' and password = '${hash}'`, (err, result) => {
        if (err) throw err;
        if (result.length === 1) {
            var employee;
            if (result[0].account_type === 0) {
                employee = 'true';
            } else {
                employee = 'false';
            }
            res.status(200).json(
                {
                    "logged_in": "true",
                    "employee": `${employee}`,
                    "id_user": `${result[0].id_user}`
                }
            );
        } else if (result.length === 0) {
            res.status(200).json(
                {
                    "logged_in": "false",
                    "employee": "false",
                    "id_user": "-1"
                }
            );
        } else {
            res.status(200).json(
                {
                    "logged_in": "false",
                    "employee": "false",
                    "id_user": "-2"
                }
            );
        }
    });
});

module.exports = router;