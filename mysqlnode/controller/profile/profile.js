var client = require("../../model/Config");

const ProfileInit = async(req, res) => {
    try {
        var profile = `SELECT profilePhoto FROM dbname.eUserDetails where id = '` + req.body.userId + `' and deleteFlag='0'`;
         var shipping = `SELECT COUNT(*) as ShippingCount FROM dbname.eUserShipping where userId = '` + req.body.userId + `' and deleteFlag='0'`;
         var payment = `SELECT COUNT(*) as PaymentCount FROM dbname.eUserPayments where userId = '` + req.body.userId + `' and deleteFlag='0'`;
         var order = `SELECT COUNT(*) as OrderCount FROM dbname.eOrderHeader where userId = '` + req.body.userId + `' and deleteFlag='0'`;
        await client.query(profile, async function(err, profilerows) {
            if (err) {
                res.send({ status: false, message: err.message });
            }  else {
//                res.send({ status: true, message:"Success", data: rows[0] });
await client.query(shipping, async function(err,shiprows) {
            if (err) {
                res.send({ status: false, message: err.message });
            }  else {
            await client.query(payment, async function(err,paymentrows) {
                        if (err) {
                            res.send({ status: false, message: err.message });
                        }  else {
                           await client.query(order, async function(err,orderrows) {
                                                if (err) {
                                                    res.send({ status: false, message: err.message });
                                                }  else {
                         res.send({ status: true, message:"Success",profile:profilerows[0],shipping:shiprows[0],payment:paymentrows[0],order:orderrows[0]});

                       }}); }});

            }});
            }
        }

        );
    } catch (e) {
        throw Error(e);
    }
};



module.exports = {
    ProfileInit
}