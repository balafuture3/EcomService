const express = require('express');
const bodyparser = require('body-parser');
const cors = require('cors');

//controller
const Main = require("./controller/main");

var app = express();
app.use(cors());
app.use(
    bodyparser.urlencoded({
        extended: true,
    })
)
app.use(bodyparser.json());
app.use(express.static(__dirname + '/public/image'));

process.env.TZ = 'Asia/Kolkata'

app.set("port", process.env.PORT || 8080);

app.listen(8080, () => {
    console.log("nodejs running this port.");
});
app.use("/main/", Main);