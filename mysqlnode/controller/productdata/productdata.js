var client = require("../../model/Config");
//SELECT eProductDetails.productId,eProductDetails.name,eProductDetails.price,eProductDetails.description,eProductDetails.image, eCategory1.name as 'rootCategory', eCategory2.name as 'secondaryCategory', eCategory3.name as 'Category'
//FROM eProductDetails
//JOIN eCategory1
//ON eProductDetails.l1CategoryId=eCategory1.id
//JOIN eCategory2
//ON eProductDetails.l2CategoryId=eCategory2.id
//JOIN eCategory3
//ON eProductDetails.l3CategoryId=eCategory3.id;
const InsertProduct = async(req, res) => {
    try {
       console.log(req.files);
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
        var sql = `INSERT INTO dbname.eProductDetails
                   (
                   name,
                   price,
                   description,
                   image,
                   sizes,
                   colors,
                   aboutItem,
                   additionalInfo,
                   discountId,
                   l1CategoryId,
                   l2CategoryId,
                   l3CategoryId,
                   createdBy,
                   updatedBy)
                   VALUES
                   (
                   '` + req.body.name + `',
                   '` + req.body.price + `',
                   '` + req.body.description + `',
                   '` + filename + `',
                   '` + req.body.sizes + `',
                   '` + req.body.colors + `',
                   '` + req.body.aboutItem + `',
                   '` + req.body.additionalInfo + `',
                   '` + req.body.discountId + `',
                   '` + req.body.l1CategoryId + `',
                   '` + req.body.l2CategoryId + `',
                   '` + req.body.l3CategoryId + `',
                   '` + req.body.createdBy + `',
                   '` + req.body.updatedBy + `')`;
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

const InsertRatings = async(req, res) => {
    try {
       console.log(req.files);
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
        var sql = `INSERT INTO dbname.eRatings
                   (
                   ratings,
                   productId,
                   comments,
                   image,
                   createdBy
                  )
                   VALUES
                   (
                   '` + req.body.ratings + `',
                   '` + req.body.productId + `',
                   '` + req.body.comments + `',
                   '` + filename + `',
                   '` + req.body.userId + `'
                   )`;
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

const SelectRatingsById = async(req, res) => {
    try {
        var sql = `SELECT eUserDetails.name,eUserDetails.profilePhoto,eRatings.* FROM dbname.eRatings join eUserDetails on eUserDetails.id = eRatings.createdBy where productId = '` + req.body.productId + `'`;
        await client.query(sql, async function(err, rows) {
            if (err) {
                res.send({status: false, message: err.message });
            }  else {
              var sql1 = `SELECT
                                       SUM(CASE WHEN ratings = 5 AND productId = '` + req.body.productId + `' THEN 1 ELSE 0 END) as rating_5,
                                       SUM(CASE WHEN ratings = 4 AND productId = '` + req.body.productId + `' THEN 1 ELSE 0 END) as rating_4,
                                       SUM(CASE WHEN ratings = 3 AND productId = '` + req.body.productId + `' THEN 1 ELSE 0 END) as rating_3,
                                       SUM(CASE WHEN ratings = 2 AND productId = '` + req.body.productId + `' THEN 1 ELSE 0 END) as rating_2,
                                       SUM(CASE WHEN ratings = 1 AND productId = '` + req.body.productId + `' THEN 1 ELSE 0 END) as rating_1,
                                       SUM(CASE WHEN ratings = 0 AND productId = '` + req.body.productId + `' THEN 1 ELSE 0 END) as rating_0
                                     FROM eRatings`;
                   await client.query(sql1, function(err, ratings) {
                       if (err) {
                           res.send({status: false, message: err.message });
                       }  else {

                res.send({ status: true, message:"Success", data: rows, rating: ratings});
            }
        });
         }
                });
    } catch (e) {
        throw Error(e);
    }
};

const SearchProducts = async(req, res) => {
    if(req.body.productId.length>1)
    {
    try {
        var sql = `SELECT productId,name,image FROM eProductDetails where name like '%` + req.body.productId + `%'`;
        await client.query(sql, function(err, rows) {
            if (err) {
                res.send({ status: false, message:err.message });
            } else if (rows.length == 0) {
                res.send({status: false, message:"cannot get Details." });
            } else {
                res.send({ status: true, message:"Success", data: rows });
            }
        });
    } catch (e) {
        throw Error(e);
    }
    }
    else
    res.send({ status: false, "error": "search string must contain at least 3 characters" });
};

const SelectProductById = async(req, res) => {
    try {
        var sql = `SELECT eRatings.ratings,eRatings.image as 'r_image',eRatings.comments,eProductInventry.quantity,eProductDetails.*,eDiscount.name as 'discountName',eDiscount.description as 'discountDescription',eDiscount.discountPercent as 'discountPercent', eCategory1.name as 'rootCategory', eCategory2.name as 'secondaryCategory', eCategory3.name as 'Category'
                   FROM eProductDetails
                   JOIN eCategory1
                   ON eProductDetails.l1CategoryId=eCategory1.id
                   JOIN eCategory2
                   ON eProductDetails.l2CategoryId=eCategory2.id
                   JOIN eDiscount
                   ON eProductDetails.discountId=eDiscount.id
                   JOIN eCategory3
                   ON eProductDetails.l3CategoryId=eCategory3.id
                   LEFT JOIN eProductInventry
                   ON eProductDetails.productId=eProductInventry.productId
                   LEFT JOIN eRatings
                   ON eProductDetails.productId=eRatings.productId
                   where eProductDetails.productId = '` + req.body.productId + `'`;
        await client.query(sql, function(err, rows) {
            if (err) {
                res.send({ status: false, message:err.message });
            } else if (rows.length == 0) {
                res.send({ status: false, message: "cannot get Details." });
            } else {
                res.send({ status: true, message:"Success", data: rows[0] });
            }
        });
    } catch (e) {
        throw Error(e);
    }
};

const GetAllProducts = async(req, res) => {
    try {
        var sql;
        if(req.body.limit=="")
        sql = `SELECT AVG(eRatings.ratings) as ratings,Count(eRatings.ratings) as ratingsCount,eProductInventry.quantity,eProductDetails.name,eProductDetails.price,eProductDetails.image,eProductDetails.productId,eDiscount.discountPercent as 'discountPercent'
                                  FROM eProductDetails
                                  JOIN eDiscount
                                  ON eProductDetails.discountId=eDiscount.id
                                  LEFT JOIN eProductInventry
                                  ON eProductDetails.productId=eProductInventry.productId
                                  LEFT JOIN eRatings
                                  ON eProductDetails.productId=eRatings.productId GROUP BY productId,eProductInventry.id`;
        else
        sql = `SELECT AVG(eRatings.ratings) as ratings,Count(eRatings.ratings) as ratingsCount,eProductInventry.quantity,eProductDetails.name,eProductDetails.price,eProductDetails.image,eProductDetails.productId,eDiscount.discountPercent as 'discountPercent'
                                  FROM eProductDetails
                                  JOIN eDiscount
                                  ON eProductDetails.discountId=eDiscount.id
                                  LEFT JOIN eProductInventry
                                  ON eProductDetails.productId=eProductInventry.productId
                                  LEFT JOIN eRatings
                                  ON eProductDetails.productId=eRatings.productId GROUP BY productId,eProductInventry.id LIMIT ` + req.body.limit + ` OFFSET ` + req.body.offset + ``;
//                   JOIN eCategory1
//                   ON eProductDetails.l1CategoryId=eCategory1.id
//                   JOIN eCategory2
//                   ON eProductDetails.l2CategoryId=eCategory2.id
//                   JOIN eCategory3
//                   ON eProductDetails.l3CategoryId=eCategory3.id`;
        await client.query(sql,async function(err, rows) {
            if (err) {
                res.send({ status: false, message:err.message });
            } else if (rows.length == 0) {
                res.send({ status: false, message: "cannot get Details." });
            } else {
              var sql1 = `SELECT eDashimages.id, eDashimages.image,
                              eDashimages.description
                          FROM dbname.eDashimages where deleteFlag ='0'`;
                    await client.query(sql1, async function(err, images) {
                        if (err) {
                            res.send({ status: false, message:err.message });
                        } else if (images.length == 0) {
                            res.send({ status: true, message:"Success", data: rows, dashimages: [],cartcount:0});

                        }
                        else {
                         var sql2 = `SELECT eCartdetails.productId FROM dbname.eCartdetails where userId = '` + req.body.userId + `'`;
                                            await client.query(sql2, function(err, cart) {
                                                if (err) {
                                                    res.send({ status: false, message:err.message });
                                                }
                                                else {
                                                res.send({ status: true, message:"Success", data: rows, dashimages: images,cartcount:cart.length});
                                        }});

                }});
                }
            });
        }
     catch (e) {
        throw Error(e);
    }
};

const SelectProductByCategory1 = async(req, res) => {
    try {
        var sql = `SELECT * FROM dbname.eProductDetails where l1CategoryId = '` + req.body.l1CategoryId + `'`;
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
const SelectProductByCategory2 = async(req, res) => {
    try {
        var sql = `SELECT * FROM dbname.eProductDetails where l2CategoryId = '` + req.body.l2CategoryId + `'`;
        await client.query(sql, function(err, rows) {
            if (err) {
                res.send({ status: false, message:err.message });
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
const SelectProductByCategory3 = async(req, res) => {
    try {
           var sql = `SELECT * FROM dbname.eProductDetails where l3CategoryId = '` + req.body.l3CategoryId + `'`;
           await client.query(sql, function(err, rows) {
               if (err) {
                   res.send({ status: false, message:err.message });
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

const SimilarProducts = async(req, res) => {
    try {
    var sql;
    if(req.body.limit=="")
       sql  = `SELECT AVG(eRatings.ratings) as ratings,Count(eRatings.ratings) as ratingsCount,eProductInventry.quantity,eProductDetails.name,eProductDetails.price,eProductDetails.image,eProductDetails.productId,eDiscount.discountPercent as 'discountPercent'
                                                 FROM eProductDetails
                                                 JOIN eDiscount
                                                 ON eProductDetails.discountId=eDiscount.id
                                                 LEFT JOIN eProductInventry
                                                 ON eProductDetails.productId=eProductInventry.productId
                                                 LEFT JOIN eRatings
                                                 ON eProductDetails.productId=eRatings.productId where eProductDetails.l3CategoryId = '` + req.body.catid + `' GROUP BY productId,eProductInventry.id `;
    else
       sql  = `SELECT AVG(eRatings.ratings) as ratings,Count(eRatings.ratings) as ratingsCount,eProductInventry.quantity,eProductDetails.name,eProductDetails.price,eProductDetails.image,eProductDetails.productId,eDiscount.discountPercent as 'discountPercent'
                                                                FROM eProductDetails
                                                                JOIN eDiscount
                                                                ON eProductDetails.discountId=eDiscount.id
                                                                LEFT JOIN eProductInventry
                                                                ON eProductDetails.productId=eProductInventry.productId
                                                                LEFT JOIN eRatings
                                                                ON eProductDetails.productId=eRatings.productId where eProductDetails.l3CategoryId = '` + req.body.catid + `' GROUP BY productId,eProductInventry.id LIMIT ` + req.body.limit + ` OFFSET ` + req.body.offset + ``;

        await client.query(sql, function(err, rows) {
            if (err) {
                res.send({ status: false, message: err.message });
            } else if (rows.length == 0) {
                res.send({ status: false, message:"cannot get Details." });
            } else {
                res.send({ status: true, message:"Success", data: rows });
            }
        });
    } catch (e) {
        throw Error(e);
    }
};

const InsertCategory1 = async(req, res) => {
    try {
       console.log(req.files);
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
        var sql = `INSERT INTO dbname.eCategory1
                   (
                   name,
                   description,
                   image,
                   createdBy,
                   updatedBy)
                   VALUES
                   (
                   '` + req.body.name + `',
                   '` + req.body.description + `',
                   '` + filename + `',
                   '` + req.body.createdBy + `',
                   '` + req.body.updatedBy + `')`;
        await client.query(sql, function(err, rows) {
            if (err) {
                res.send({ status: false, message:err.message });
            } else if (rows.length == 0) {
                res.send({ status: false, message:"Cannot Login." });
            } else {
                res.send({ status: true, message:"Success", data: rows[0] });
            }
        });
    } catch (e) {
        throw Error(e);
    }
};
const InsertCategory2 = async(req, res) => {
    try {
       console.log(req.files);
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
        var sql = `INSERT INTO dbname.eCategory2
                   (
                   name,
                   description,
                   image,
                   cat1id,
                   createdBy,
                   updatedBy)
                   VALUES
                   (
                   '` + req.body.name + `',
                   '` + req.body.description + `',
                   '` + filename + `',
                   '` + req.body.cat1id + `',
                   '` + req.body.createdBy + `',
                   '` + req.body.updatedBy + `')`;
        await client.query(sql, function(err, rows) {
            if (err) {
                res.send({ status: false, message: err.message });
            } else if (rows.length == 0) {
                res.send({ status: false, message:"Cannot Login." });
            } else {
                res.send({ status: true, message:"Success", data: rows[0] });
            }
        });
    } catch (e) {
        throw Error(e);
    }
};
const InsertCategory3 = async(req, res) => {
    try {
       console.log(req.files);
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
        var sql = `INSERT INTO dbname.eCategory3
                   (
                   name,
                   description,
                   image,
                   cat1id,
                   cat2id,
                   createdBy,
                   updatedBy)
                   VALUES
                   (
                   '` + req.body.name + `',
                   '` + req.body.description + `',
                   '` + filename + `',
                   '` + req.body.cat1id + `',
                   '` + req.body.cat2id + `',
                   '` + req.body.createdBy + `',
                   '` + req.body.updatedBy + `')`;
        await client.query(sql, function(err, rows) {
            if (err) {
                res.send({ status: false, message: err.message });
            } else if (rows.length == 0) {
                res.send({status: false, message: "Cannot Login." });
            } else {
                res.send({ status: true, message:"Success", data: rows[0] });
            }
        });
    } catch (e) {
        throw Error(e);
    }
};

const InsertDiscount = async(req, res) => {
    try {
        var sql = `INSERT INTO dbname.eDiscount (name,description,discountPercent) VALUES ('` + req.body.name + `','` + req.body.description + `','` + req.body.discountPercent + `')`;
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

const InsertInventry = async(req, res) => {
    try {
        var sql = `INSERT INTO dbname.eProductInventry (productId,quantity,locationId) VALUES ('` + req.body.productId + `','` + req.body.quantity + `','` + req.body.locationId + `')`;
        await client.query(sql, function(err, rows) {
            if (err) {
                res.send({ status: false, message: err.message });
            } else if (rows.affectedRows == 0) {
                res.send({ status: false, message: "Cannot Insert." });
            } else {
                res.send({ status: true, message:"Success", data: rows[0] });
            }
        });
    } catch (e) {
        throw Error(e);
    }
};

const GetAllDiscounts = async(req, res) => {
    try {
        var sql = `select eDiscount.id,eDiscount.name,eDiscount.description,eDiscount.discountPercent,eDiscount.active from dbname.eDiscount`;
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

const SelectDiscountById = async(req, res) => {
    try {
        var sql = `select eDiscount.id,eDiscount.name,eDiscount.description,eDiscount.discountPercent,eDiscount.active from dbname.eDiscount where id = '` + req.body.id + `'`;
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

const SelectFavouritesById = async(req, res) => {
    try {
        var sql = `select eFavorites.productId from dbname.eFavorites where userId = '` + req.body.userId + `'`;
        await client.query(sql, function(err, rows) {
            if (err) {
                res.send({status: false, message: err.message });
            } else {
            let b = []
            rows.map((value,index)=>{
                b.push(value.productId)
            })
                res.send({ status: true, message:"Success", data: b });
            }
        });
    } catch (e) {
        throw Error(e);
    }
};

const SelectFavouritesData = async(req, res) => {
    try {

        var sql =     `SELECT eRatings.ratings,eProductInventry.quantity,eProductDetails.name,eProductDetails.price,eProductDetails.image,eProductDetails.productId,eProductDetails.colors,eProductDetails.sizes,eDiscount.discountPercent as 'discountPercent',eCategory3.name as 'Category'
                                         FROM eProductDetails
                                         JOIN eDiscount
                                         ON eProductDetails.discountId=eDiscount.id
                                         LEFT JOIN eProductInventry
                                         ON eProductDetails.productId=eProductInventry.productId
                                         LEFT JOIN eRatings
                                         ON eProductDetails.productId=eRatings.productId
                                         JOIN eFavorites ON eProductDetails.productId=eFavorites.productId
                                         JOIN eCategory3
                                         ON eProductDetails.l3CategoryId=eCategory3.id
                                         where userId = '` + req.body.userId + `'`;
        await client.query(sql, function(err, rows) {
            if (err) {
                res.send({status: false, message: err.message });
            } else {
                res.send({ status: true, message:"Success", data: rows });
            }
        });
    } catch (e) {
        throw Error(e);
    }
};

const InsertFavourites = async(req, res) => {
    try {
        var sql = `INSERT INTO dbname.eFavorites (productId,userId) VALUES ('` + req.body.productId + `','` + req.body.userId + `')`;
        await client.query(sql, function(err, rows) {
            if (err) {
                res.send({ status: false, message: err.message });
            } else if (rows.affectedRows == 0) {
                res.send({ status: false, message: "Cannot Insert." });
            } else {
                res.send({ status: true, message:"Success", data: rows[0] });
            }
        });
    } catch (e) {
        throw Error(e);
    }
};

const DeleteFavourites = async(req, res) => {
    try {
        var sql = `DELETE FROM dbname.eFavorites where userId = '` + req.body.userId + `' and productId = '` + req.body.productId + `'`;
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
const UpdateDiscount = async(req, res) => {
    try {
    var sql ;

    if(!req.body.onlyactive)
    {
       sql = `UPDATE dbname.eDiscount
                   SET
                   name = '` + req.body.name + `',
                   discountPercent = '` + req.body.discountPercent + `',
                   active = '` + req.body.active + `',
                   description = '` + req.body.description + `' WHERE id = '` + req.body.id + `'`;
    }
    else
    {
    sql = `UPDATE dbname.eDiscount SET active = '` + req.body.active + `'
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

const SelectAllCategory = async(req, res) => {
    try {
     var sql = `SELECT eCategory1.name,eCategory1.image,eCategory1.description,eCategory1.id FROM dbname.eCategory1 where deleteFlag='0'`;
     var sql1 = `SELECT eCategory2.name,eCategory2.image,eCategory2.description,eCategory2.id,eCategory2.cat1id FROM dbname.eCategory2 where deleteFlag='0'`;
     var sql2 = `SELECT eCategory3.name,eCategory3.image,eCategory3.description,eCategory3.id,eCategory3.cat2id,eCategory3.cat1id FROM dbname.eCategory3 where deleteFlag='0'`;
        await client.query(sql,async function(err, cat1row) {
          await client.query(sql1,async function(err, cat2row) {
            await client.query(sql2,async function(err, cat3row) {
             res.send({ status: true, message:"Success", master:cat1row,secondary:cat2row,primary:cat3row });
            });
          });

        });
    } catch (e) {
        throw Error(e);
    }
};

module.exports = {
    InsertProduct,
    GetAllProducts,
    SearchProducts,
    SelectProductById,
    SelectProductByCategory1,
    SelectProductByCategory2,
    SelectProductByCategory3,
    InsertCategory1,
    InsertCategory2,
    InsertCategory3,
    InsertDiscount,
    GetAllDiscounts,
    SelectDiscountById,
    UpdateDiscount,
    InsertInventry,
    InsertRatings,
    SelectRatingsById,
    SimilarProducts,
    SelectFavouritesById,
    InsertFavourites,
    DeleteFavourites,
    SelectAllCategory,
    SelectFavouritesData
}