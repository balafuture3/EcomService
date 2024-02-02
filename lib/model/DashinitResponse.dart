/// status : true
/// message : "Success"
/// data : [{"ratings":null,"ratingsCount":0,"quantity":10,"name":"Apple laptop","price":"500.00","image":"under-construction.webp","productId":4,"discountPercent":"20"},{"ratings":null,"ratingsCount":0,"quantity":100,"name":"Sony laptop","price":"500.00","image":"Electronics.png","productId":6,"discountPercent":"0"},{"ratings":"5.00000","ratingsCount":1,"quantity":50,"name":"Mens Dress","price":"500.00","image":"Fashion.png","productId":8,"discountPercent":"0"},{"ratings":null,"ratingsCount":0,"quantity":500,"name":"Surf Excel","price":"200.00","image":"Grocery.png","productId":9,"discountPercent":"0"},{"ratings":null,"ratingsCount":0,"quantity":2,"name":"Macbook Pro","price":"200.00","image":"Toys.png","productId":10,"discountPercent":"14"},{"ratings":null,"ratingsCount":0,"quantity":222,"name":"Sony Camera","price":"2000.00","image":"sony-apsc-ilce-6100y-b-in5-mirrorless-original-imafm6msr4fghzfw.webp;sony-apsc-ilce-6100y-b-in5-mirrorless-original-imafmsk4ghubfdpy.webp;sony-apsc-ilce-6100y-b-in5-mirrorless-original-imafmsk5bbgzgc5x.webp;sony-apsc-ilce-6100y-b-in5-mirrorless-original-imafmsk5nzcgnvjc.webp;sony-apsc-ilce-6100y-b-in5-mirrorless-original-imafmsk5ukm4f2za.webp;sony-apsc-ilce-6100y-b-in5-mirrorless-original-imafmsk44yf24ejk.webp","productId":11,"discountPercent":"20"},{"ratings":null,"ratingsCount":0,"quantity":302,"name":"Pattu Frog","price":"2000.00","image":"91fvA-kh7NL._SY879_.jpg;91J7nLKNjbL._SX679_.jpg","productId":12,"discountPercent":"14"},{"ratings":null,"ratingsCount":0,"quantity":null,"name":"Manoj","price":"5000.00","image":"Mobile.png","productId":14,"discountPercent":"0"}]
/// dashimages : [{"id":1,"image":"1.jpg","description":"Electronics"},{"id":2,"image":"2.jpg","description":"Food"},{"id":3,"image":"3.jpg","description":"Home Appliances"}]
/// cartcount : 0

class DashinitResponse {
  DashinitResponse({
      bool? status, 
      String? message, 
      List<Data>? data, 
      List<Dashimages>? dashimages, 
      num? cartcount,}){
    _status = status;
    _message = message;
    _data = data;
    _dashimages = dashimages;
    _cartcount = cartcount;
}

  DashinitResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    if (json['dashimages'] != null) {
      _dashimages = [];
      json['dashimages'].forEach((v) {
        _dashimages?.add(Dashimages.fromJson(v));
      });
    }
    _cartcount = json['cartcount'];
  }
  bool? _status;
  String? _message;
  List<Data>? _data;
  List<Dashimages>? _dashimages;
  num? _cartcount;
DashinitResponse copyWith({  bool? status,
  String? message,
  List<Data>? data,
  List<Dashimages>? dashimages,
  num? cartcount,
}) => DashinitResponse(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
  dashimages: dashimages ?? _dashimages,
  cartcount: cartcount ?? _cartcount,
);
  bool? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;
  List<Dashimages>? get dashimages => _dashimages;
  num? get cartcount => _cartcount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_dashimages != null) {
      map['dashimages'] = _dashimages?.map((v) => v.toJson()).toList();
    }
    map['cartcount'] = _cartcount;
    return map;
  }

}

/// id : 1
/// image : "1.jpg"
/// description : "Electronics"

class Dashimages {
  Dashimages({
      num? id, 
      String? image, 
      String? description,}){
    _id = id;
    _image = image;
    _description = description;
}

  Dashimages.fromJson(dynamic json) {
    _id = json['id'];
    _image = json['image'];
    _description = json['description'];
  }
  num? _id;
  String? _image;
  String? _description;
Dashimages copyWith({  num? id,
  String? image,
  String? description,
}) => Dashimages(  id: id ?? _id,
  image: image ?? _image,
  description: description ?? _description,
);
  num? get id => _id;
  String? get image => _image;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['image'] = _image;
    map['description'] = _description;
    return map;
  }

}

/// ratings : null
/// ratingsCount : 0
/// quantity : 10
/// name : "Apple laptop"
/// price : "500.00"
/// image : "under-construction.webp"
/// productId : 4
/// discountPercent : "20"

class Data {
  Data({
      dynamic ratings, 
      num? ratingsCount, 
      num? quantity, 
      String? name, 
      String? price, 
      String? image, 
      num? productId, 
      String? discountPercent,}){
    _ratings = ratings;
    _ratingsCount = ratingsCount;
    _quantity = quantity;
    _name = name;
    _price = price;
    _image = image;
    _productId = productId;
    _discountPercent = discountPercent;
}

  Data.fromJson(dynamic json) {
    _ratings = json['ratings'];
    _ratingsCount = json['ratingsCount'];
    _quantity = json['quantity'];
    _name = json['name'];
    _price = json['price'];
    _image = json['image'];
    _productId = json['productId'];
    _discountPercent = json['discountPercent'];
  }
  dynamic _ratings;
  num? _ratingsCount;
  num? _quantity;
  String? _name;
  String? _price;
  String? _image;
  num? _productId;
  String? _discountPercent;
Data copyWith({  dynamic ratings,
  num? ratingsCount,
  num? quantity,
  String? name,
  String? price,
  String? image,
  num? productId,
  String? discountPercent,
}) => Data(  ratings: ratings ?? _ratings,
  ratingsCount: ratingsCount ?? _ratingsCount,
  quantity: quantity ?? _quantity,
  name: name ?? _name,
  price: price ?? _price,
  image: image ?? _image,
  productId: productId ?? _productId,
  discountPercent: discountPercent ?? _discountPercent,
);
  dynamic get ratings => _ratings;
  num? get ratingsCount => _ratingsCount;
  num? get quantity => _quantity;
  String? get name => _name;
  String? get price => _price;
  String? get image => _image;
  num? get productId => _productId;
  String? get discountPercent => _discountPercent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ratings'] = _ratings;
    map['ratingsCount'] = _ratingsCount;
    map['quantity'] = _quantity;
    map['name'] = _name;
    map['price'] = _price;
    map['image'] = _image;
    map['productId'] = _productId;
    map['discountPercent'] = _discountPercent;
    return map;
  }

}