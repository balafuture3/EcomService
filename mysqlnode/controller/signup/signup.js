var client = require("../../model/Config");

const InsertUser = async(req, res) => {
    try {
      var sql = `select * from dbname.eUserDetails
                       where
                       deleteFlag = '0' and mobileNumber = '` + req.body.mobileNumber + `' and email= '` + req.body.email + `'` ;
            await client.query(sql, async function(err, rows) {
                if (err) {
                    res.send({ status: false, message: err.message });
                }
                else if (rows.length == 0) {

        var sql1 = `INSERT INTO dbname.eUserDetails
                   (
                    name,
                   email,
                   mobileNumber,
                   categoryId,
                   password,
                   address,
                   latitude,
                   longitude,
                   profilePhoto,
                   firebaseId,
                   createdBy,
                   updatedBy) VALUES
                   (
                   '` + req.body.name + `',
                   '` + req.body.email + `',
                   '` + req.body.mobileNumber + `',
                   '` + req.body.categoryId + `',
                   '` + req.body.password + `',
                   '` + req.body.address + `',
                   '` + req.body.latitude + `',
                   '` + req.body.longitude + `',
                   '` + req.body.profilePhoto + `',
                   '` + req.body.firebaseId + `',
                   '` + req.body.createdBy + `',
                   '` + req.body.updatedBy + `')`;
        await client.query(sql1, function(err, rows) {
            if (err) {
                res.send({status: false, message: err.message });
            } else if (rows.affectedRows == 0) {
                res.send({ status: false, message: "Cannot Create account." });
            } else {
                res.send({ status: true, message:"Success", data: rows[0] });
            }
        });
         }
         else {
         res.send({ status: false, message: "User already exists" });
        }
    });}
    catch (e) {
        throw Error(e);
    }
};

const ForgotPassword = async(req, res) => {
    try {
        var sql = `UPDATE dbname.eUserDetails
                   SET
                   password = '` + req.body.password + `'
                   WHERE mobileNumber = '` + req.body.mobileNumber + `' and email = '` + req.body.email + `'`;
        await client.query(sql, function(err, rows) {
            if (err) {
                res.send({ status: false, message: err.message });
            } else if (rows.affectedRows == 0) {
                res.send({ status: false, message: "Cannot update password." });
            } else {
                res.send({ status: true, message:"Success", data: rows[0] });
            }
        });
    } catch (e) {
        throw Error(e);
    }
};

const UpdateProfile = async(req, res) => {
    try {
    var filename="";
    filename+=req.files[0]["filename"];
        var sql = `UPDATE dbname.eUserDetails
                   SET
                   profilePhoto = '` + filename + `'
                   WHERE id = '` + req.body.id + `'`;
        await client.query(sql, function(err, rows) {
            if (err) {
                res.send({ status: false, message:err.message });
            } else if (rows.affectedRows == 0) {
                res.send({ status: false, message: "Something went wrong." });
            } else {
                res.send({ status: true, message:"Success", data: rows[0] });
            }
        });
    } catch (e) {
        throw Error(e);
    }
};

const UpdateUser = async(req, res) => {
    try {
        var sql = `UPDATE dbname.eUserDetails
                   SET
                   name = '` + req.body.name + `',
                   email = '` + req.body.email + `',
                   categoryId = '` + req.body.categoryId + `',
                   mobileNumber = '` + req.body.mobileNumber + `',
                   address = '` + req.body.address + `',
                   latitude = '` + req.body.latitude + `',
                   longitude = '` + req.body.longitude + `',
                   updatedBy = '` + req.body.updatedBy + `'
                   WHERE id = '` + req.body.id + `'`;
        await client.query(sql, function(err, rows) {
            if (err) {
                res.send({ status: false, message: err.message });
            } else if (rows.affectedRows == 0) {
                res.send({ status: false, message: "Something went wrong." });
            } else {
                res.send({ status: true, message:"Success", data: rows[0] });
            }
        });
    } catch (e) {
        throw Error(e);
    }
};

const UpdateFirebaseId = async(req, res) => {
    try {
        var sql = `UPDATE dbname.eUserDetails
                   SET
                   firebaseId = '` + req.body.fid + `'
                   WHERE id = '` + req.body.id + `'`;
        await client.query(sql, function(err, rows) {
            if (err) {
                res.send({ status: false, message:err.message });
            } else if (rows.affectedRows == 0) {
                res.send({ status: false, message:"Something went wrong." });
            } else {
                res.send({ status: true, message:"Success", data: rows[0] });
            }
        });
    } catch (e) {
        throw Error(e);
    }
};

const DeleteUser = async(req, res) => {
    try {
        var sql = `UPDATE dbname.eUserDetails
                   SET
                   deleteFlag = '1'
                   WHERE id = '` + req.body.id + `'`;
        await client.query(sql, function(err, rows) {
            if (err) {
                res.send({ status: false, message: err.message });
            } else if (rows.affectedRows == 0) {
                res.send({ status: false, message: "Something went wrong." });
            } else {
                res.send({ status: true, message:"Success", data: rows[0] });
            }
        });
    } catch (e) {
        throw Error(e);
    }
};

const GetAllUsers = async(req, res) => {
    try {
        var sql = `select * from dbname.eUserDetails
                   where
                   deleteFlag = '0'`;
        await client.query(sql, function(err, rows) {
            if (err) {
                res.send({ status: false, message: err.message });
            } else if (rows.affectedRows == 0) {
                res.send({status: false, message: "Something went wrong." });
            } else {
                res.send({ status: true, message:"Success", data: rows });
            }
        });
    } catch (e) {
        throw Error(e);
    }
};

module.exports = {
    InsertUser,
    GetAllUsers,
    ForgotPassword,
    UpdateProfile,
    UpdateFirebaseId,
    UpdateUser,
    DeleteUser
}