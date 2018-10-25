const express = require('express');
const cors = require('cors');
const session = require('express-session');

// Configuraciones.
const PORT = 8000;
const CORS_OPTS = {
    origin: 'http://localhost:4200',
    credentials: true,
    optionsSuccessStatus: 200
};

// Rutas.
const account = require('./routes/account');
const cart = require('./routes/cart');
const home = require('./routes/home');
const locations = require('./routes/locations');
const menu = require('./routes/menu');
const orders = require('./routes/orders');

const app = express();

app.use(express.json());

app.use(cors(CORS_OPTS));

app.use(session({secret: '123456', resave: true, saveUninitialized: true}));

app.use('/', home);
app.use('/account', account);
app.use('/account/cart', cart);
app.use('/locations', locations);
app.use('/menu', menu);
app.use('/account/orders', orders);

app.listen( PORT, () => {
    console.log(`Express Server (Port ${PORT}: \x1b[32m%s\x1b[0m)`, 'online' );
} );
