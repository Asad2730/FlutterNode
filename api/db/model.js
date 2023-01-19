const con = require('./conn');



module.exports.signup = (req, res) => {

    let obj = { email: req.body.email, password: req.body.password };

    con.query('insert into user set ?', obj, (err, row, field) => {
        if (err) return err;
        res.json('user inserted');
        res.end();
    });

}