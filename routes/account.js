const express = require('express');
const database = require('../database');
const router = express.Router();

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

module.exports = router;