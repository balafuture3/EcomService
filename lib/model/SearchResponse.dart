/// status : true
/// message : "Success"
/// data : [{"productId":2,"name":"bala","price":"500.00","description":"test","image":"VVDN_Logo.png","rootCategory":"Electronics","secondaryCategory":"Mobiles","Category":"Touch Screen mobiles"}]

class SearchResponse {
  SearchResponse({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  SearchResponse.fromJson(dynamic json) {
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
SearchResponse copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => SearchResponse(  status: status ?? _status,
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

/// productId : 2
/// name : "bala"
/// price : "500.00"
/// description : "test"
/// image : "VVDN_Logo.png"
/// rootCategory : "Electronics"
/// secondaryCategory : "Mobiles"
/// Category : "Touch Screen mobiles"

class Data {
  Data({
      num? productId, 
      String? name, 
      String? price, 
      String? description, 
      String? image, 
      String? rootCategory, 
      String? secondaryCategory, 
      String? category,}){
    _productId = productId;
    _name = name;
    _price = price;
    _description = description;
    _image = image;
    _rootCategory = rootCategory;
    _secondaryCategory = secondaryCategory;
    _category = category;
}

  Data.fromJson(dynamic json) {
    _productId = json['productId'];
    _name = json['name'];
    _price = json['price'];
    _description = json['description'];
    _image = json['image'];
    _rootCategory = json['rootCategory'];
    _secondaryCategory = json['secondaryCategory'];
    _category = json['Category'];
  }
  num? _productId;
  String? _name;
  String? _price;
  String? _description;
  String? _image;
  String? _rootCategory;
  String? _secondaryCategory;
  String? _category;
Data copyWith({  num? productId,
  String? name,
  String? price,
  String? description,
  String? image,
  String? rootCategory,
  String? secondaryCategory,
  String? category,
}) => Data(  productId: productId ?? _productId,
  name: name ?? _name,
  price: price ?? _price,
  description: description ?? _description,
  image: image ?? _image,
  rootCategory: rootCategory ?? _rootCategory,
  secondaryCategory: secondaryCategory ?? _secondaryCategory,
  category: category ?? _category,
);
  num? get productId => _productId;
  String? get name => _name;
  String? get price => _price;
  String? get description => _description;
  String? get image => _image;
  String? get rootCategory => _rootCategory;
  String? get secondaryCategory => _secondaryCategory;
  String? get category => _category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productId'] = _productId;
    map['name'] = _name;
    map['price'] = _price;
    map['description'] = _description;
    map['image'] = _image;
    map['rootCategory'] = _rootCategory;
    map['secondaryCategory'] = _secondaryCategory;
    map['Category'] = _category;
    return map;
  }

}