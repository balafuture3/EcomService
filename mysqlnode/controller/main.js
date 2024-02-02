const express = require("express");
var router = express.Router();
const upload = require('../middleware/fileupload');

//bala
const Login = require('./login/login');
const Signup = require('./signup/signup');
const Product = require('./productdata/productdata');
const Order = require('./order/order');
const Profile = require('./profile/profile');

//bala
router.post("/login", Login.SelectUser);

router.post("/signup/insertuser", Signup.InsertUser);
router.post("/signup/forgotpassword", Signup.ForgotPassword);
router.post("/signup/updateprofilephoto",upload.uploadad.array('IMAGE'), Signup.UpdateProfile);
router.post("/signup/updateuser",Signup.UpdateUser);
router.post("/signup/updatefid",Signup.UpdateFirebaseId);
router.post("/signup/deleteuser",Signup.DeleteUser);
router.get("/signup/getalluser",Signup.GetAllUsers);

router.post("/productdata/insert", upload.uploadad.array('IMAGE'), Product.InsertProduct);
router.post("/productdata/selectall", Product.GetAllProducts);
router.post("/productdata/selectbyid", Product.SelectProductById);
router.post("/productdata/searchproducts", Product.SearchProducts);
router.post("/productdata/similarproducts", Product.SimilarProducts);

router.post("/productdata/favourites", Product.SelectFavouritesById);
router.post("/productdata/favouritesdata", Product.SelectFavouritesData);
router.post("/productdata/insertfavourites", Product.InsertFavourites);
router.post("/productdata/deletefavourites", Product.DeleteFavourites);


router.post("/productdata/selectallcat", Product.SelectAllCategory);
router.post("/productdata/selectbycat1", Product.SelectProductByCategory1);
router.post("/productdata/selectbycat2", Product.SelectProductByCategory2);
router.post("/productdata/selectbycat3", Product.SelectProductByCategory3);
router.post("/productdata/insertcat1",  upload.uploadad.array('IMAGE'), Product.InsertCategory1);
router.post("/productdata/insertcat2", upload.uploadad.array('IMAGE'),  Product.InsertCategory2);
router.post("/productdata/insertcat3", upload.uploadad.array('IMAGE'),  Product.InsertCategory3);

router.post("/productdata/insertdiscont", Product.InsertDiscount);
router.get("/productdata/getdiscounts", Product.GetAllDiscounts);
router.post("/productdata/getdiscountbyid", Product.SelectDiscountById);
router.post("/productdata/updatediscount", Product.UpdateDiscount);

router.post("/productdata/insertinventry", Product.InsertInventry);

router.post("/productdata/insertratings", upload.uploadad.array('IMAGE'),Product.InsertRatings);
router.post("/productdata/getratingsbyid", Product.SelectRatingsById);


router.post("/order/placeorder", Order.PlaceOrder);
router.get("/order/getallorders", Order.GetAllOrders);
router.post("/order/id", Order.SelectOrderbyId);
router.post("/order/userid", Order.SelectOrderbyUser);
router.post("/order/addcart", Order.AddtoCart);
router.post("/order/selectusercart", Order.SelectUserCart);
router.post("/order/deletecart", Order.DeleteCart);
router.post("/order/deletecartbyuser", Order.DeleteCartByUser);

router.post("/order/insertpromo",upload.uploadad.array('IMAGE'), Order.InsertPromo);
router.get("/order/getpromo", Order.GetAllPromo);
router.post("/order/getpromobyid", Order.SelectPromoById);
router.post("/order/updatepromo", Order.UpdatePromo);

router.post("/order/addpayment", Order.AddPaymentDetails);
router.post("/order/selectpayment", Order.SelectAllPayment);
router.post("/order/deletepayment", Order.DeletePayment);
router.post("/order/updatepayment", Order.UpdatePayment);
router.post("/order/defaultpayment", Order.DefaultPayment);

router.post("/order/addshipping", Order.AddShipping);
router.post("/order/selectshipping", Order.SelectAllShipping);
router.post("/order/deleteshipping", Order.DeleteShipping);
router.post("/order/updateshipping", Order.UpdateShipping);
router.post("/order/defaultshipping", Order.DefaultShipping);


router.post("/profile/profileinit", Profile.ProfileInit);
module.exports = router;