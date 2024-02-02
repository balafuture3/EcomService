/// status : true
/// message : "Success"
/// data : [{"ratings":"2.0","quantity":100,"name":"Sony laptop","price":"500.00","image":"Electronics.png","productId":6,"colors":null,"sizes":null,"discountPercent":"0","Category":"Touch Screen mobiles"},{"ratings":"4.0","quantity":10,"name":"Apple laptop","price":"500.00","image":"under-construction.webp","productId":4,"colors":null,"sizes":null,"discountPercent":"20","Category":"Touch Screen mobiles"},{"ratings":"5.0","quantity":50,"name":"Mens Dress","price":"500.00","image":"Fashion.png","productId":8,"colors":null,"sizes":null,"discountPercent":"0","Category":"Touch Screen mobiles"},{"ratings":"4.5","quantity":302,"name":"Pattu Frog","price":"2000.00","image":"91fvA-kh7NL._SY879_.jpg;91J7nLKNjbL._SX679_.jpg","productId":12,"colors":"#FF5733;#FFdcba;#51FF00","sizes":"S;L;M;XL;XXL;XXXL","discountPercent":"14","Category":"Touch Screen mobiles"}]

class FavouritesDataResponse {
  FavouritesDataResponse({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  FavouritesDataResponse.fromJson(dynamic json) {
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
FavouritesDataResponse copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => FavouritesDataResponse(  status: status ?? _status,
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

/// ratings : "2.0"
/// quantity : 100
/// name : "Sony laptop"
/// price : "500.00"
/// image : "Electronics.png"
/// productId : 6
/// colors : null
/// sizes : null
/// discountPercent : "0"
/// Category : "Touch Screen mobiles"

class Data {
  Data({
      String? ratings, 
      num? quantity, 
      String? name, 
      String? price, 
      String? image, 
      num? productId, 
      dynamic colors, 
      dynamic sizes, 
      String? discountPercent, 
      String? category,}){
    _ratings = ratings;
    _quantity = quantity;
    _name = name;
    _price = price;
    _image = image;
    _productId = productId;
    _colors = colors;
    _sizes = sizes;
    _discountPercent = discountPercent;
    _category = category;
}

  Data.fromJson(dynamic json) {
    _ratings = json['ratings'];
    _quantity = json['quantity'];
    _name = json['name'];
    _price = json['price'];
    _image = json['image'];
    _productId = json['productId'];
    _colors = json['colors'];
    _sizes = json['sizes'];
    _discountPercent = json['discountPercent'];
    _category = json['Category'];
  }
  String? _ratings;
  num? _quantity;
  String? _name;
  String? _price;
  String? _image;
  num? _productId;
  dynamic _colors;
  dynamic _sizes;
  String? _discountPercent;
  String? _category;
Data copyWith({  String? ratings,
  num? quantity,
  String? name,
  String? price,
  String? image,
  num? productId,
  dynamic colors,
  dynamic sizes,
  String? discountPercent,
  String? category,
}) => Data(  ratings: ratings ?? _ratings,
  quantity: quantity ?? _quantity,
  name: name ?? _name,
  price: price ?? _price,
  image: image ?? _image,
  productId: productId ?? _productId,
  colors: colors ?? _colors,
  sizes: sizes ?? _sizes,
  discountPercent: discountPercent ?? _discountPercent,
  category: category ?? _category,
);
  String? get ratings => _ratings;
  num? get quantity => _quantity;
  String? get name => _name;
  String? get price => _price;
  String? get image => _image;
  num? get productId => _productId;
  dynamic get colors => _colors;
  dynamic get sizes => _sizes;
  String? get discountPercent => _discountPercent;
  String? get category => _category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ratings'] = _ratings;
    map['quantity'] = _quantity;
    map['name'] = _name;
    map['price'] = _price;
    map['image'] = _image;
    map['productId'] = _productId;
    map['colors'] = _colors;
    map['sizes'] = _sizes;
    map['discountPercent'] = _discountPercent;
    map['Category'] = _category;
    return map;
  }

}