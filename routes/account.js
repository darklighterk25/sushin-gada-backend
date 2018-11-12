const express = require('express');
const database = require('../database');
const router = express.Router();
const crypto = require('crypto');

router.get('/', (req, res) => {
    database.query(`select name, lastName1, lastName2, birthDate, gender, email, address from accounts_view where id_user = ${req.session.id_user}`, (err, result) => {
        result = result.map(row => (row.address = JSON.parse(row.address), row));
        res.status(200).json(result[0]);
    });
});

router.delete('/delete', (req, res) => {
    if (req.session.id_user){
        database.query(`update user set active = 0 where id_user = ${req.session.id_user}`, (err) => {
            if(err) throw err;
            req.session = null;
            res.status(200).json({
                "status" : 200
            });
        });
    }
    else {
        res.status(404).json({
            "status": "404"
        });
    }
});

router.post('/login', (req, res) => {
    const hash = crypto.createHash('sha256').update(req.body['password']).digest('hex');
    database.query(`SELECT id_user, account_type FROM user where email = '${req.body['email']}' and password = '${hash}' and active = 1`, (err, result) => {
        if (err) throw err;
        if (result.length === 1) {
            var employee = result[0].account_type === 0;
            req.session.employee = employee;
            req.session.id_user = result[0].id_user;
            res.status(200).json({
                "logged_in": "true",
                "employee": `${employee}`,
                "id_user": `${result[0].id_user}`,
                "status": 200
            });
        }
        else if (result.length === 0) {
            res.status(401).json({
                "status": 401
            });
        }
        else {
            res.status(409).json({
                "status": 409
            });
        }
    });
});

router.get('/logout', (req, res) => {
    req.session = null;
    res.status(200).json({
        "status": 200
    });
});

router.get('/logged', (req, res) => {
    if (req.session.id_user) {
        res.status(200).json({
            "logged_in": "true",
            "employee": `${req.session.employee}`,
            "id_user": `${req.session.id_user}`,
            "status": 200
        });
    }    
    else {
        res.status(403).json({
            "status": 403
        });
    }
});

router.put('/signup', (req, res) => {
    const hash = crypto.createHash('sha256').update(req.body['password']).digest('hex');
    database.query(`call sign_up(
                        "${ req.body['address'].street }",
                        "${ req.body['address'].number }",
                        "${ req.body['address'].interiorNumber }",
                        "${ req.body['address'].neighborhood }",
                        "${ req.body['address'].zipCode }",
                        "${ req.body['address'].phone }",
                        "${ req.body['name'] }",
                        "${ req.body['lastName1'] }",
                        "${ req.body['lastName2'] }",
                        "${ req.body['birthDate'] }",
                        ${ req.body['gender'] },
                        "${ req.body['email'] }",
                        "${ hash }"
                    )`, (err, result) => {
        if (err) throw err;
        res.status(200).json({
            "status": 200
        });
    });
});

router.put('/edit', (req, res) => {
    const hash = crypto.createHash('sha256').update(req.body['password']).digest('hex');
    database.query(`update table user set(
                        "${ req.body['address'].street }",
                        "${ req.body['address'].number }",
                        "${ req.body['address'].interiorNumber }",
                        "${ req.body['address'].neighborhood }",
                        "${ req.body['address'].zipCode }",
                        "${ req.body['address'].phone }",
                        "${ req.body['name'] }",
                        "${ req.body['lastName1'] }",
                        "${ req.body['lastName2'] }",
                        "${ req.body['birthDate'] }",
                        ${ req.body['gender'] },
                        "${ req.body['email'] }",
                        "${ hash }"
                    )`, (err, result) => {
        if (err) throw err;
        res.status(200).json({
            "status": 200
        });
    });
});

module.exports = router;