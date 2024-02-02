var client = require("../../model/Config");
const PlaceOrder = async(req, res) => {
    try {
    console.log(req.body.details);
    var OrderDetails = req.body.details;
    var sql = `INSERT INTO dbname.eOrderHeader
                   (
                   userId,
                   orderTotal,
                   paymentId,
                   shippingId,
                   paymentStatus,
                   promoCode,
                   promoPercent,
                   createdBy,
                   updatedBy)
                   VALUES
                   (
                   '` + req.body.userId + `',
                   '` + req.body.orderTotal + `',
                   '` + req.body.paymentId + `',
                   '` + req.body.shippingId + `',
                   '` + req.body.paymentStatus + `',
                   '` + req.body.promoCode + `',
                   '` + req.body.promoPercent + `',
                   '` + req.body.createdBy + `',
                   '` + req.body.updatedBy + `')`;
        await client.query(sql, async function(err, rows) {
        console.log(rows.insertId);
            if (err) {
                res.send({ status: false, message: err.message });
            } else if (rows.length == 0) {
                res.send({ status: false, message:"Cannot Login." });
            } else {
            var count=0;
                   var params = [];
                                            OrderDetails.forEach(element => {
                                                params.push([
                                                    rows.insertId,
                                                    element.productName,
                                                    element.productId,
                                                    element.quantity,
                                                    element.price,
                                                    element.image,
                                                    element.sizeVarient,
                                                    element.colorVarient
                                                ]);
                                            });
                 var sql1 = `INSERT INTO dbname.eOrderdetails
                                                   (
                                                   orderId,
                                                   productName,
                                                   productId,
                                                   quantity,
                                                   price,
                                                   image,
                                                   sizeVarient,
                                                   colorVarient
                                                   )
                                                   VALUES
                                                   ?;`;
                                                     await client.query(sql1,[params], async function(err, rows) {
//                                                           console.log(rows.insertId);
                                                               if (err) {
                                                                   res.send({ status: false, message: err.message });
                                                               } else if (rows.length == 0) {
                                                                   res.send({ status: false, message: "Cannot Login." });
                                                               } else {
                                                               res.send({ status: true, message:"Success", data: rows[0] });
                                                               }
                });




            }
        });
    } catch (e) {
        throw Error(e);
    }
};

const GetAllOrders = async(req, res) => {
    try {
        var sql = `SELECT
        eOrderHeader.userId,
        eOrderHeader.orderTotal,
        eOrderHeader.paymentId,
        eOrderHeader.createdOn,
        eOrderHeader.paymentStatus from eOrderHeader`;
        await client.query(sql, function(err, rows) {
            if (err) {
                res.send({ status: false, message: err.message });
            } else if (rows.length == 0) {
                res.send({ status: false, message: "cannot get Details." });
            } else {
                res.send({ status: true, message:"Success", data: rows });
            }
        });
    } catch (e) {
        throw Error(e);
    }
};

const SelectOrderbyId = async(req, res) => {
    try {

        var sql = `SELECT
        eOrderHeader.id,
        eOrderHeader.userId,
        eOrderHeader.orderTotal,
        eOrderHeader.paymentId,
        eOrderHeader.shippingId,
        eOrderHeader.orderStatus,
        eOrderHeader.createdOn,
        eOrderHeader.promoCode,
        eOrderHeader.promoPercent,
        eOrderHeader.trackingId,eOrderHeader.paymentStatus,eUserShipping.address,eUserShipping.name as shippingName,eUserShipping.city,eUserShipping.state,eUserShipping.country
                                                  ,eUserPayments.cvv,eUserPayments.name as cardName,eUserPayments.expiry,eUserPayments.cardNo FROM dbname.eOrderHeader join eOrderdetails on eOrderdetails.orderId=eOrderHeader.id  join eUserShipping on eUserShipping.id=eOrderHeader.shippingId join eUserPayments on eUserPayments.id=eOrderHeader.paymentId where eOrderHeader.id= '` + req.body.orderId + `' group by eOrderHeader.id`;
        await client.query(sql,async function(err, headerdata) {
            if (err) {
                res.send({ status: false, message: err.message });
            } else if (headerdata.length == 0) {
                res.send({ status: false, message: "cannot get Details." });
            } else {
               var sql = `SELECT
                    eOrderdetails.productName,
                    eOrderdetails.productId,
                    eOrderdetails.quantity,
                    eOrderdetails.price,
                    eOrderdetails.image,
                    eOrderdetails.sizeVarient,
                    eOrderdetails.colorVarient,
                    eOrderdetails.id from eOrderdetails where orderId =  '` + req.body.orderId + `'`;
                await client.query(sql, function(err, detailsdata) {
                  if (err) {
                                res.send({status: false, message: err.message });
                            } else if (detailsdata.length == 0) {
                                res.send({ status: false, message: "cannot get Details." });
                            } else {
                             res.send({ status: true,message:"Success", header:headerdata, details:detailsdata });
                            }
                });
            }
       } );
    } catch (e) {
        throw Error(e);
    }
};

const SelectOrderbyUser = async(req, res) => {
    try {
        var sql = `SELECT
                           eOrderHeader.id,
                           eOrderHeader.userId,
                           eOrderHeader.orderTotal,
                           eOrderHeader.paymentId,
                           eOrderHeader.shippingId,
                           eOrderHeader.orderStatus,
                           eOrderHeader.createdOn,
                           eOrderHeader.trackingId,
                           eOrderHeader.promoCode,
                           eOrderHeader.promoPercent,
                           eOrderHeader.paymentStatus,eUserShipping.address,eUserShipping.name as shippingName,eUserShipping.city,eUserShipping.state,eUserShipping.country
                           ,eUserPayments.cvv,eUserPayments.name as cardName,eUserPayments.expiry,eUserPayments.cardNo ,COUNT(eOrderdetails.id) AS itemCount FROM dbname.eOrderHeader join eOrderdetails on eOrderdetails.orderId=eOrderHeader.id  join eUserShipping on eUserShipping.id=eOrderHeader.shippingId join eUserPayments on eUserPayments.id=eOrderHeader.paymentId where eOrderHeader.userId= '` + req.body.userId + `' group by eOrderHeader.id`;
        await client.query(sql,async function(err, headerdata) {

                  if (err) {
                                res.send({ status: false, message: err.message });
                            } else if (headerdata.length == 0) {
                                res.send({ status: false, message:"cannot get Details." });
                            } else {
                             res.send({ status: true, message:"Success", data:headerdata });
                            }

            }
        );
    } catch (e) {
        throw Error(e);
    }
};

const AddtoCart = async(req, res) => {
    try {
    console.log(req.body.details);
    var CartDetails = req.body.details;
            var count=0;
                   var params = [];
                                            CartDetails.forEach(element => {
                                                params.push([
                                                    element.userId,
                                                    element.productName,
                                                    element.productId,
                                                    element.quantity,
                                                    element.price,
                                                    element.colorVarient,
                                                    element.sizeVarient,
                                                ]);
                                            });
                                                    var sql = `SELECT * from eCartdetails where userId =  '` + req.body.details[0].userId + `' and productId = '` + req.body.details[0].productId + `'`;
                                                    await client.query(sql,async function(err, detailsdata) {

                                                              if (err) {
                                                                            res.send({ status: false, message: err.message });
                                                                        } else if (detailsdata.length != 0) {
                                                                            res.send({ status: false, message:"Product already in your cart" });
                                                                        } else {
                 var sql = `INSERT INTO dbname.eCartdetails
                                                   (
                                                   userId,
                                                   productName,
                                                   productId,
                                                   quantity,
                                                   price,
                                                   colorVarient,
                                                   sizeVarient)
                                                   VALUES
                                                   ?;`;
                                                     await client.query(sql,[params], async function(err, rows) {
//                                                           console.log(rows.insertId);
                                                               if (err) {
                                                                   res.send({ status: false, message: err.message });
                                                               } else if (rows.length == 0) {
                                                                   res.send({ status: false, message: "Cannot Insert." });
                                                               } else {
                                                               res.send({ status: true, message:"Success", data: rows[0] });
                                                               }
                                                               });
                }
                });
    } catch (e) {
        throw Error(e);
    }
};

const SelectUserCart = async(req, res) => {
    try {
        var sql = `SELECT eCartdetails.*,eProductDetails.image from eCartdetails
        JOIN eProductDetails on eProductDetails.productId = eCartdetails.productId
        where eCartdetails.userId =  '` + req.body.userId + `'`;
        await client.query(sql,async function(err, detailsdata) {

                  if (err) {
                                res.send({ status: false, message: err.message });
                            } else if (detailsdata.length == 0) {
                                res.send({ status: true,data:[], message:"Success" });
                            } else {
                             res.send({ status: true, message:"Success", data:detailsdata ,count:detailsdata.length });
                            }

            }
        );
    } catch (e) {
        throw Error(e);
    }
};
const DeleteCart = async(req, res) => {
    try {
        var sql = `DELETE FROM dbname.eCartdetails where userId = '` + req.body.userId + `' and productId = '` + req.body.productId + `'`;
        await client.query(sql, function(err, rows) {
            if (err) {
                res.send({ status: false, message: err.message });
            } else if (rows.affectedRows == 0) {
                res.send({ status: false, message: "Cannot Delete." });
            } else {
                res.send({ status: true, message:"Success", data: rows[0] });
            }
        });
    } catch (e) {
        throw Error(e);
    }
};

const DeleteCartByUser = async(req, res) => {
    try {
        var sql = `DELETE FROM dbname.eCartdetails where userId = '` + req.body.userId + `'`;
        await client.query(sql, function(err, rows) {
            if (err) {
                res.send({ status: false, message: err.message });
            } else if (rows.affectedRows == 0) {
                res.send({ status: false, message: "Cannot Delete." });
            } else {
                res.send({ status: true, message:"Success", data: rows[0] });
            }
        });
    } catch (e) {
        throw Error(e);
    }
};


const InsertPromo = async(req, res) => {
    try {
          console.log(req.files.length);
          var filename="";
          for(let i=0;i<req.files.length;i++)
          {
          if(i==req.files.length-1)
          filename+=req.files[i]["filename"];
          else
          filename+=req.files[i]["filename"]+";";
          }
       console.log(filename);
        var sql = `INSERT INTO dbname.ePromoCodes (name,description,percent,image) VALUES ('` + req.body.name + `','` + req.body.description + `','` + req.body.percent + `','` + filename + `')`;
        await client.query(sql, function(err, rows) {
            if (err) {
                res.send({ status: false, message: err.message });
            } else if (rows.length == 0) {
                res.send({ status: false, message: "Cannot Insert." });
            } else {
                res.send({ status: true, message:"Success", data: rows[0] });
            }
        });
    } catch (e) {
        throw Error(e);
    }
};

const GetAllPromo = async(req, res) => {
    try {
        var sql = `select ePromoCodes.id,ePromoCodes.name,ePromoCodes.image,ePromoCodes.description,ePromoCodes.percent,ePromoCodes.active from dbname.ePromoCodes`;
        await client.query(sql,async function(err, rows) {
            if (err) {
                res.send({ status: false, message:err.message });
            } else if (rows.length == 0) {
                res.send({ status: false, message: "cannot get Details." });
            } else {
                         res.send({ status: true, message:"Success", data: rows});
                }});
                }
     catch (e) {
        throw Error(e);
    }
};

const SelectPromoById = async(req, res) => {
    try {
        var sql = `select ePromoCodes.id,ePromoCodes.name,ePromoCodes.description,ePromoCodes.percent,ePromoCodes.active from dbname.ePromoCodes where id = '` + req.body.id + `'`;
        await client.query(sql, function(err, rows) {
            if (err) {
                res.send({status: false, message: err.message });
            } else if (rows.length == 0) {
                res.send({ status: false, message:"cannot get Details." });
            } else {
                res.send({ status: true, message:"Success", data: rows[0] });
            }
        });
    } catch (e) {
        throw Error(e);
    }
};

const UpdatePromo = async(req, res) => {
    try {
    var sql ;

    if(!req.body.onlyactive)
    {
       sql = `UPDATE dbname.ePromoCodes
                   SET
                   name = '` + req.body.name + `',
                   percent = '` + req.body.percent + `',
                   active = '` + req.body.active + `',
                   description = '` + req.body.description + `' WHERE id = '` + req.body.id + `'`;
    }
    else
    {
    sql = `UPDATE dbname.ePromoCodes SET active = '` + req.body.active + `'
                       WHERE id = '` + req.body.id + `'`;
    }

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

const AddPaymentDetails = async(req, res) => {
    try {
    console.log(req.body.defaultPayment);
        if(req.body.defaultPayment===1 )
        {
       var sql1 =  `UPDATE dbname.eUserPayments SET defaultPayment = '0' WHERE userId = '` + req.body.userId + `'`;
                                              await client.query(sql1, async function(err, rows) {
                                                  if (err) {
                                                  console.log(err);
                                                  } else {
    var sql = `INSERT INTO dbname.eUserPayments
                   (
                   userId,
                   name,
                   cvv,
                   cardNo,
                   expiry,
                   defaultPayment)
                   VALUES
                   (
                   '` + req.body.userId + `',
                   '` + req.body.name + `',
                   '` + req.body.cvv + `',
                   '` + req.body.cardNo + `',
                   '` + req.body.expiry + `',
                   '` + req.body.defaultPayment + `'

                   )`;
        await client.query(sql, async function(err, rows) {
            if (err) {
                res.send({ status: false, message: err.message });
            } else if (rows.length == 0) {
                res.send({ status: false, message:"Cannot Login." });
            } else {
           res.send({ status: true, message:"Success", data: rows[0] });

            }
        });
                                                  }
                                              });
        }
else{
    var sql = `INSERT INTO dbname.eUserPayments
                   (
                   userId,
                   name,
                   cvv,
                   cardNo,
                   expiry,
                   defaultPayment)
                   VALUES
                   (
                   '` + req.body.userId + `',
                   '` + req.body.name + `',
                   '` + req.body.cvv + `',
                   '` + req.body.cardNo + `',
                   '` + req.body.expiry + `',
                   '` + req.body.defaultPayment + `'

                   )`;
        await client.query(sql, async function(err, rows) {
            if (err) {
                res.send({ status: false, message: err.message });
            } else if (rows.length == 0) {
                res.send({ status: false, message:"Cannot Login." });
            } else {
           res.send({ status: true, message:"Success", data: rows[0] });

            }
        });
        }
    } catch (e) {
        throw Error(e);
    }
};

const SelectAllPayment= async(req, res) => {
    try {
        var sql = `SELECT
        eUserPayments.id,
         eUserPayments.userId,
         eUserPayments.name,
         eUserPayments.cvv,
         eUserPayments.cardNo,
         eUserPayments.expiry,
         eUserPayments.defaultPayment
        from eUserPayments where userId =  '` + req.body.userId + `' and deleteFlag='0'`;
        await client.query(sql,async function(err, headerdata) {

                  if (err) {
                                res.send({ status: false, message: err.message });
                            } else if (headerdata.length == 0) {
                                res.send({ status: false, message:"cannot get Details." });
                            } else {
                             res.send({ status: true, message:"Success", data:headerdata });
                            }

            }
        );
    } catch (e) {
        throw Error(e);
    }
};

const DeletePayment = async(req, res) => {
    try {
    var sql ;
    sql = `UPDATE dbname.eUserPayments SET deleteFlag = '1'
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

const UpdatePayment = async(req, res) => {
    try {

      var  sql = `UPDATE dbname.eUserPayments
                                  SET
                                  name = '` + req.body.name + `',
                                  cvv = '` + req.body.cvv + `',
                                  cardNo = '` + req.body.cardNo + `',
                                  expiry = '` + req.body.expiry + `',
                                  defaultPayment = '` + req.body.defaultPayment + `',
                                  deleteFlag = '` + req.body.deleteFlag + `' WHERE id = '` + req.body.id + `'`;

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

const DefaultPayment = async(req, res) => {
    try {

      var  sql = `UPDATE dbname.eUserPayments SET defaultPayment = '0' WHERE userId = '` + req.body.userId + `'`;

            await client.query(sql, async function(err, rows) {
                if (err) {
                    res.send({ status: false, message: err.message });
                }  else {

      var  sql1 = `UPDATE dbname.eUserPayments SET defaultPayment = '1' WHERE id = '` + req.body.id + `'`;

            await client.query(sql1, function(err, rows) {
                if (err) {
                    res.send({ status: false, message: err.message });
                } else if (rows.affectedRows == 0) {
                    res.send({ status: false, message: "Something went wrong." });
                } else {
                    res.send({ status: true, message:"Success", data: rows[0] });
                }
            });
    }
     }
     );
     }catch (e) {
        throw Error(e);
    }
};

const AddShipping = async(req, res) => {
  console.log(req.body.defaultAddress);
    try {
    if(req.body.defaultAddress===1)
    {
   var sql1 =  `UPDATE dbname.eUserShipping SET defaultAddress = '0' WHERE userId = '` + req.body.userId + `'`;
                                          await client.query(sql1, async function(err, rows) {
                                              if (err) {
                                              res.send({ status: false, message: err.message });
                                              } else {
    var sql = `INSERT INTO dbname.eUserShipping
                   (
                   userId,
                   name,
                   address,
                   city,
                   state,
                   country,
                   zipcode,
                   defaultAddress)
                   VALUES
                   (
                   '` + req.body.userId + `',
                   '` + req.body.name + `',
                   '` + req.body.address + `',
                   '` + req.body.city + `',
                   '` + req.body.state + `',
                   '` + req.body.country + `',
                   '` + req.body.zipcode + `',
                   '` + req.body.defaultAddress + `'

                   )`;
        await client.query(sql, async function(err, rows) {
            if (err) {
                res.send({ status: false, message: err.message });
            } else if (rows.length == 0) {
                res.send({ status: false, message:"Cannot Login." });
            } else {
           res.send({ status: true, message:"Success", data: rows[0] });

            }

                                          });
    }});}
    else
    {
    var sql = `INSERT INTO dbname.eUserShipping
                   (
                   userId,
                   name,
                   address,
                   city,
                   state,
                   country,
                   zipcode,
                   defaultAddress)
                   VALUES
                   (
                   '` + req.body.userId + `',
                   '` + req.body.name + `',
                   '` + req.body.address + `',
                   '` + req.body.city + `',
                   '` + req.body.state + `',
                   '` + req.body.country + `',
                   '` + req.body.zipcode + `',
                   '` + req.body.defaultAddress + `'

                   )`;
        await client.query(sql, async function(err, rows) {
            if (err) {
                res.send({ status: false, message: err.message });
            } else if (rows.length == 0) {
                res.send({ status: false, message:"Cannot Login." });
            } else {
           res.send({ status: true, message:"Success", data: rows[0] });

            }
        });
        }
    } catch (e) {
        throw Error(e);
    }
};

const SelectAllShipping= async(req, res) => {
    try {
        var sql = `SELECT eUserShipping.id,
                             eUserShipping.userId,
                            eUserShipping.address,
                            eUserShipping.name,
                            eUserShipping.city,
                            eUserShipping.state,
                            eUserShipping.country,
                            eUserShipping.zipcode,
                            eUserShipping.defaultAddress
        from eUserShipping where userId =  '` + req.body.userId + `' and deleteFlag='0'`;
        await client.query(sql,async function(err, headerdata) {

                  if (err) {
                                res.send({ status: false, message: err.message });
                            } else if (headerdata.length == 0) {
                                res.send({ status: false, message:"cannot get Details." });
                            } else {
                             res.send({ status: true, message:"Success", data:headerdata });
                            }

            }
        );
    } catch (e) {
        throw Error(e);
    }
};

const DeleteShipping = async(req, res) => {
    try {

   var sql = `UPDATE dbname.eUserShipping SET deleteFlag = '1'
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

const UpdateShipping = async(req, res) => {
    try {

          var  sql = `UPDATE dbname.eUserShipping
                                      SET
                                      name = '` + req.body.name + `',
                                      address = '` + req.body.address + `',
                                      city = '` + req.body.city + `',
                                      state = '` + req.body.state + `',
                                      country = '` + req.body.country + `',
                                      zipcode = '` + req.body.zipcode + `',
                                      defaultAddress = '` + req.body.defaultAddress + `' WHERE id = '` + req.body.id + `'`;

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

const DefaultShipping = async(req, res) => {
    try {
          var  sql = `UPDATE dbname.eUserShipping
                                      SET defaultAddress = '0' WHERE userId = '` + req.body.userId + `'`;

                await client.query(sql,async function(err, rows) {
                    if (err) {
                        res.send({ status: false, message: err.message });
                    }  else {
          var  sql1 = `UPDATE dbname.eUserShipping
                                      SET defaultAddress = '1' WHERE id = '` + req.body.id + `'`;

                await client.query(sql1, function(err, rows) {
                    if (err) {
                        res.send({ status: false, message: err.message });
                    } else if (rows.affectedRows == 0) {
                        res.send({ status: false, message: "Something went wrong." });
                    } else {
                        res.send({ status: true, message:"Success", data: rows[0] });
                    }
                });

    }
     });
     }catch (e) {
        throw Error(e);
    }
};

module.exports = {
PlaceOrder,
GetAllOrders,
SelectOrderbyId,
SelectOrderbyUser,
AddtoCart,
SelectUserCart,
DeleteCart,
DeleteCartByUser,
InsertPromo,
GetAllPromo,
SelectPromoById,
UpdatePromo,
AddPaymentDetails,
SelectAllPayment,
DeletePayment,
UpdatePayment,
DefaultPayment,
AddShipping,
SelectAllShipping,
DeleteShipping,
UpdateShipping,
DefaultShipping
}