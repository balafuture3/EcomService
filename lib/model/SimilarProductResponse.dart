/// status : true
/// message : "Success"
/// data : [{"quantity":10,"ratings":"4.0","name":"Apple laptop","price":"500.00","image":"under-construction.webp","productId":4,"discountPercent":"20"},{"quantity":100,"ratings":"2.0","name":"Sony laptop","price":"500.00","image":"Electronics.png","productId":6,"discountPercent":"0"},{"quantity":50,"ratings":"5.0","name":"Mens Dress","price":"500.00","image":"Fashion.png","productId":8,"discountPercent":"0"},{"quantity":500,"ratings":null,"name":"Surf Excel","price":"200.00","image":"Grocery.png","productId":9,"discountPercent":"0"},{"quantity":2,"ratings":null,"name":"Macbook Pro","price":"200.00","image":"Toys.png","productId":10,"discountPercent":"14"},{"quantity":222,"ratings":null,"name":"Sony Camera","price":"2000.00","image":"sony-apsc-ilce-6100y-b-in5-mirrorless-original-imafm6msr4fghzfw.webp;sony-apsc-ilce-6100y-b-in5-mirrorless-original-imafmsk4ghubfdpy.webp;sony-apsc-ilce-6100y-b-in5-mirrorless-original-imafmsk5bbgzgc5x.webp;sony-apsc-ilce-6100y-b-in5-mirrorless-original-imafmsk5nzcgnvjc.webp;sony-apsc-ilce-6100y-b-in5-mirrorless-original-imafmsk5ukm4f2za.webp;sony-apsc-ilce-6100y-b-in5-mirrorless-original-imafmsk44yf24ejk.webp","productId":11,"discountPercent":"20"},{"quantity":302,"ratings":"4.5","name":"Pattu Frog","price":"2000.00","image":"91fvA-kh7NL._SY879_.jpg;91J7nLKNjbL._SX679_.jpg","productId":12,"discountPercent":"14"},{"quantity":null,"ratings":null,"name":"Manoj","price":"5000.00","image":"Mobile.png","productId":14,"discountPercent":"0"}]

class SimilarProductResponse {
  SimilarProductResponse({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  SimilarProductResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<Data>? _data;
SimilarProductResponse copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => SimilarProductResponse(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// quantity : 10
/// ratings : "4.0"
/// name : "Apple laptop"
/// price : "500.00"
/// image : "under-construction.webp"
/// productId : 4
/// discountPercent : "20"

class Data {
  Data({
      num? quantity, 
      String? ratings, 
      String? name, 
      String? price, 
      String? image, 
      num? productId, 
      String? discountPercent,}){
    _quantity = quantity;
    _ratings = ratings;
    _name = name;
    _price = price;
    _image = image;
    _productId = productId;
    _discountPercent = discountPercent;
}

  Data.fromJson(dynamic json) {
    _quantity = json['quantity'];
    _ratings = json['ratings'];
    _name = json['name'];
    _price = json['price'];
    _image = json['image'];
    _productId = json['productId'];
    _discountPercent = json['discountPercent'];
  }
  num? _quantity;
  String? _ratings;
  String? _name;
  String? _price;
  String? _image;
  num? _productId;
  String? _discountPercent;
Data copyWith({  num? quantity,
  String? ratings,
  String? name,
  String? price,
  String? image,
  num? productId,
  String? discountPercent,
}) => Data(  quantity: quantity ?? _quantity,
  ratings: ratings ?? _ratings,
  name: name ?? _name,
  price: price ?? _price,
  image: image ?? _image,
  productId: productId ?? _productId,
  discountPercent: discountPercent ?? _discountPercent,
);
  num? get quantity => _quantity;
  String? get ratings => _ratings;
  String? get name => _name;
  String? get price => _price;
  String? get image => _image;
  num? get productId => _productId;
  String? get discountPercent => _discountPercent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['quantity'] = _quantity;
    map['ratings'] = _ratings;
    map['name'] = _name;
    map['price'] = _price;
    map['image'] = _image;
    map['productId'] = _productId;
    map['discountPercent'] = _discountPercent;
    return map;
  }

}