const express = require('express');
const database = require('../database');
const router = express.Router();

router.get('/', (req, res) => {
    res.status(200).json(
        [
            {
                "id": "2085",
                "date": new Date('August 25, 2018 14:24:00'),
                "items": [
                    {
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
                "items": [
                    {
                        "name": "Unagui",
                        "type": "dish",
                        "description": "Rollo de alga, salmón y anguila.",
                        "picture": "https://imgur.com/oogRI5R.jpg",
                        "quantity": 1,
                        "price": 120
                    }
                ],
                "total": 120
            },
        ]
    );
});

module.exports = router;