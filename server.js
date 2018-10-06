const bodyParser = require('body-parser');
const express = require('express');

// Configuraciones.
const PORT = 8000;

// Rutas.
const account = require('./routes/account');
const cart = require('./routes/cart');
const home = require('./routes/home');
const locations = require('./routes/locations');
const menu = require('./routes/menu');
const orders = require('./routes/orders');

const app = express();

app.use(bodyParser.json());

app.use('/', home);
app.use('/account', account);
app.use('/account/cart', cart);
app.use('/locations', locations);
app.use('/menu', menu);
app.use('/account/orders', orders);

app.listen( 8000, () => {
    console.log('Express Server (Port 8000: \x1b[32m%s\x1b[0m)', 'online' );
} );
