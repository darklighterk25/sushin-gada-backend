const express = require('express');
const database = require('../database');
const router = express.Router();

router.get('/sales-by-branch', (req, res) => {
    if (req.session.id_user) {
        database.query('select name, sum(total) as total from purchase natural join location  where month(date) = month(curdate()) and closed = 1 group by name', (err, result) => {
            if (err) throw err;
            res.status(200).json(result);
        });
    } else {
        res.status(401).json({
            "status": 401
        });
    }
});

router.get('/top-sales', (req, res) => {
    if (req.session.id_user) {
        database.query('select name, sum(total) as total from purchase natural join location where month(date) = month(curdate()) and closed = 1 group by name having total = (select max(total) from (select name, sum(total) as total from purchase natural join location  where month(date) = month(curdate()) and closed = 1 group by name) as a)', (err, result) => {
            if (err) throw err;
            res.status(200).json(result[0]);
        });
    } else {
        res.status(401).json({
            "status": 401
        });
    }
});

router.get('/top-orders', (req, res) => {
    if (req.session.id_user) {
        database.query('select concat(name, " ", last_name1) as name, count(id_user) as quantity from purchase natural join user where closed = 1 group by id_user having quantity = (select max(quantity) from (select count(id_user) as quantity from purchase where closed = 1 group by id_user) as a)', (err, result) => {
            if (err) throw err;
            res.status(200).json(result[0]);
        });
    } else {
        res.status(401).json({
            "status": 401
        });
    }
});

router.get('/top-money-spent', (req, res) => {
    if (req.session.id_user) {
        database.query('select concat(name, " ", last_name1) as name, sum(total) as total from purchase natural join user where closed = 1 group by id_user having total = (select max(total) from (select sum(total) as total from purchase natural join user where closed = 1 group by id_user) as a)', (err, result) => {
            if (err) throw err;
            res.status(200).json(result[0]);
        });
    } else {
        res.status(401).json({
            "status": 401
        });
    }
});

router.get('/most-sold', (req, res) => {
    if (req.session.id_user) {
        database.query('select name, count(id_items) as quantity from items natural join menu natural join purchase where closed = 1 group by id_item having quantity = (select max(quantity) from (select count(id_item) as quantity from items natural join purchase where closed = 1 group by id_item) as a)', (err, result) => {
            if (err) throw err;
            res.status(200).json(result[0]);
        });
    } else {
        res.status(401).json({
            "status": 401
        });
    }
});

router.get('/product-sales', (req, res) => {
    if (req.session.id_user) {
        database.query('select name, count(id_item) as quantity from items natural join menu natural join purchase where closed = 1 and month(date) = month(curdate()) group by id_item', (err, result) => {
            if (err) throw err;
            res.status(200).json(result);
        });
    } else {
        res.status(401).json({
            "status": 401
        });
    }
});

router.get('/sales-by-type', (req, res) => {
    if (req.session.id_user) {
        database.query('select type.name, count(type.name) as quantity from purchase join items join menu join type on purchase.id_purchase = items.id_purchase and items.id_item = menu.id_item and menu.id_type = type.id_type where closed = 1 group by (type.name)', (err, result) => {
            if (err) throw err;
            res.status(200).json(result);
        });
    } else {
        res.status(401).json({
            "status": 401
        });
    }
});

router.get('/gender-quantity', (req, res) => {
    if (req.session.id_user) {
        database.query('select gender, count(gender) as quantity from user group by gender', (err, result) => {
            if (err) throw err;
            res.status(200).json(result);
        });
    } else {
        res.status(401).json({
            "status": 401
        });
    }
});

router.get('/sales-per-employee', (req, res) => {
    if (req.session.id_user) {
        database.query('select concat(name, " ", last_name1) as name, count(id_user) as quantity from user natural join purchase where closed = 1 and account_type = 0 group by id_user', (err, result) => {
            if (err) throw err;
            res.status(200).json(result);
        });
    } else {
        res.status(401).json({
            "status": 401
        });
    }
});

module.exports = router;