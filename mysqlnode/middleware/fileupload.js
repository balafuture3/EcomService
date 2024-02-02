const path = require("path");
var multer = require('multer');

var storagead = multer.diskStorage({
    destination: function(req, file, cb) {
        cb(null, 'public/image/')
    },
    filename: function(req, file, cb) {
        cb(null, file.originalname)
    }
});

const uploadad = multer({
    storage: storagead
});



// SET STORAGE
var singlestorage = multer.diskStorage({
    destination: function(req, file, cb) {
        cb(null, 'public/video')
    },
    filename: function(req, file, cb) {
        cb(null, file.originalname)
    }
})

const uploadsingle = multer({ storage: singlestorage }).fields([{ name: "VIDEO", maxCount: 1 }, { name: "IMAGE", maxCount: 1 }]);

module.exports = {
    uploadad,
    uploadsingle
}