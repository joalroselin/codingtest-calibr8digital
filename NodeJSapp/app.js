const express = require('express');
const expressLayouts = require('express-ejs-layouts');
const app = express();
const mongoose = require('mongoose');
const flash = require('connect-flash');
const session = require('express-session');
var path = require('path');

//connect to db
const db = require('./config/keys').MongoURI;
//promise
mongoose.connect(db, { useNewUrlParser: true})
    .then(() => console.log('MongoDB Connected'))
    .catch(err => console.log(err));

//still not very good at coding promises
//and routing

app.use(expressLayouts);
app.set('view engine', 'ejs')
app.use(express.urlencoded({ extended: false}));

app.use(session({
    secret: 'keyboard cat',
    resave: true,
    saveUninitialized: true
  }))

app.use(flash());

app.set('views', path.join(__dirname, 'views'));
app.get('./partials/messages', function (req, res) {
    res.render('messages', {title: 'title'});
});


app.use('/', require('./routes/index'));
app.use('/users', require('./routes/users'));
const PORT = process.env.PORT || 5000;

app.listen(PORT, console.log(`Server started on port ${PORT}`));
