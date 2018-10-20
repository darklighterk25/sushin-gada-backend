const express = require('express');
const database = require('../database');
const router = express.Router();

router.get('/', (req, res) => {
    res.status(200).json(
        {
            "id": "7548",
            "date": new Date('August 25, 2018 14:24:00'),
            "items": [
                {
                    "name": "Tres Quesos",
                    "type": "dish",
                    "description": "Empanizado de queso manchego, queso amarillo y philadelphia.",
                    "picture": "https://imgur.com/KyfakjL.jpg",
                    "quantity": 1,
                    "price": 82
                },
                {
                    "name": "Té Helado",
                    "type": "drink",
                    "description": "Té helado de limón adornado con hojas de menta y rodajas de limón.",
                    "picture": "https://imgur.com/ZbVM4ZC.jpg",
                    "quantity": 2,
                    "price": 35
                },
                {
                    "name": "Sushin' Gada Roll",
                    "type": "dish",
                    "description": "Cangrejo y philadelphia con topping maki bañado con salsa de anguila.",
                    "picture": "https://imgur.com/q5TIYlW.jpg",
                    "quantity": 1,
                    "price": 135
                }
            ],
            "total": 287
        }
    );
});

module.exports = router;