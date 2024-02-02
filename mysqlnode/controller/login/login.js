var client = require("../../model/Config");

const SelectUser = async(req, res) => {
    try {
        var sql = `SELECT * FROM dbname.eUserDetails where mobileNumber = '` + req.body.mobileNumber + `' AND password ='` + req.body.password + `' AND deleteFlag='0'`;
        await client.query(sql, function(err, rows) {
            if (err) {
                res.send({ status: false, message: err.message });
            } else if (rows.length == 0) {
                res.send({ status: false, message: "Cannot Login." });
            } else {
                res.send({ status: true, message:"Success", data: rows[0] });
            }
        });
    } catch (e) {
        throw Error(e);
    }
};



module.exports = {
    SelectUser
}