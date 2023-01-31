const con = require('./conn');


module.exports.signup = (req, res) => {

    let obj = { email: req.body.email, password: req.body.password };

    con.query('insert into user set ?', obj, (err, row, field) => {
        if (err) return err;
        res.json('user inserted');
        res.end();
    });

}


module.exports.login = (req, res) => {

    let obj = { email: req.params.email, password: req.params.password };
    con.query('select * from user where email =? and password = ?', [obj.email, obj.password], (err, row, field) => {
        if (err) return err;
        res.json(row);
        res.end();
    });

}


module.exports.getData = (req, res) => {

    let uid = req.params.uid;
    con.query('select * from data where uid = ?', [uid], (err, row, field) => {
        if (err) return err;
        res.json(row);
        res.end();
    });
}

module.exports.postData = (req, res) => {

    let obj = { uid: req.body.uid, name: req.body.name, no: req.body.no };
    con.query('insert into data set ?', obj, (err, row, field) => {
        if (err) return err;
        res.json('Data inserted!');
        res.end();
    });
}


module.exports.deleteData = (req, res) => {

    let id = req.params.id;
    con.query('delete  from data where id = ?', [id], (err, row, field) => {
        if (err) return err;
        res.json('Contact Deleted!');
        res.end();
    });
}