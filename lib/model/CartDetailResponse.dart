/// status : true
/// message : "Success"
/// data : [{"id":1,"userId":10007,"productName":"Apple laptop","productId":4,"quantity":1,"price":"500.00","sizeVarient":null,"colorVarient":null,"createdOn":"2024-01-08T01:31:52.000Z","createdBy":null,"updatedOn":"2024-01-08T01:31:52.000Z","updatedBy":null,"deleteFlag":0,"image":"under-construction.webp"},{"id":2,"userId":10007,"productName":"Sony laptop","productId":6,"quantity":1,"price":"500.00","sizeVarient":null,"colorVarient":null,"createdOn":"2024-01-08T01:39:01.000Z","createdBy":null,"updatedOn":"2024-01-08T01:39:01.000Z","updatedBy":null,"deleteFlag":0,"image":"Electronics.png"},{"id":3,"userId":10007,"productName":"Pattu Frog","productId":12,"quantity":1,"price":"2000.00","sizeVarient":"S","colorVarient":"#FF5733","createdOn":"2024-01-08T01:43:25.000Z","createdBy":null,"updatedOn":"2024-01-08T01:43:25.000Z","updatedBy":null,"deleteFlag":0,"image":"91fvA-kh7NL._SY879_.jpg;91J7nLKNjbL._SX679_.jpg"},{"id":4,"userId":10007,"productName":"Mens Dress","productId":8,"quantity":1,"price":"500.00","sizeVarient":null,"colorVarient":null,"createdOn":"2024-01-08T01:43:45.000Z","createdBy":null,"updatedOn":"2024-01-08T01:43:45.000Z","updatedBy":null,"deleteFlag":0,"image":"Fashion.png"}]
/// count : 4

class CartDetailResponse {
  CartDetailResponse({
      bool? status, 
      String? message, 
      List<Data>? data, 
      num? count,}){
    _status = status;
    _message = message;
    _data = data;
    _count = count;
}

  CartDetailResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _count = json['count'];
  }
  bool? _status;
  String? _message;
  List<Data>? _data;
  num? _count;
CartDetailResponse copyWith({  bool? status,
  String? message,
  List<Data>? data,
  num? count,
}) => CartDetailResponse(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
  count: count ?? _count,
);
  bool? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;
  num? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['count'] = _count;
    return map;
  }

}

/// id : 1
/// userId : 10007
/// productName : "Apple laptop"
/// productId : 4
/// quantity : 1
/// price : "500.00"
/// sizeVarient : null
/// colorVarient : null
/// createdOn : "2024-01-08T01:31:52.000Z"
/// createdBy : null
/// updatedOn : "2024-01-08T01:31:52.000Z"
/// updatedBy : null
/// deleteFlag : 0
/// image : "under-construction.webp"

class Data {
  Data({
      num? id, 
      num? userId, 
      String? productName, 
      num? productId, 
      num? quantity, 
      String? price, 
      dynamic sizeVarient, 
      dynamic colorVarient, 
      String? createdOn, 
      dynamic createdBy, 
      String? updatedOn, 
      dynamic updatedBy, 
      num? deleteFlag, 
      String? image,}){
    _id = id;
    _userId = userId;
    _productName = productName;
    _productId = productId;
    _quantity = quantity;
    _price = price;
    _sizeVarient = sizeVarient;
    _colorVarient = colorVarient;
    _createdOn = createdOn;
    _createdBy = createdBy;
    _updatedOn = updatedOn;
    _updatedBy = updatedBy;
    _deleteFlag = deleteFlag;
    _image = image;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['userId'];
    _productName = json['productName'];
    _productId = json['productId'];
    _quantity = json['quantity'];
    _price = json['price'];
    _sizeVarient = json['sizeVarient'];
    _colorVarient = json['colorVarient'];
    _createdOn = json['createdOn'];
    _createdBy = json['createdBy'];
    _updatedOn = json['updatedOn'];
    _updatedBy = json['updatedBy'];
    _deleteFlag = json['deleteFlag'];
    _image = json['image'];
  }
  num? _id;
  num? _userId;
  String? _productName;
  num? _productId;
  num? _quantity;
  String? _price;
  dynamic _sizeVarient;
  dynamic _colorVarient;
  String? _createdOn;
  dynamic _createdBy;
  String? _updatedOn;
  dynamic _updatedBy;
  num? _deleteFlag;
  String? _image;
Data copyWith({  num? id,
  num? userId,
  String? productName,
  num? productId,
  num? quantity,
  String? price,
  dynamic sizeVarient,
  dynamic colorVarient,
  String? createdOn,
  dynamic createdBy,
  String? updatedOn,
  dynamic updatedBy,
  num? deleteFlag,
  String? image,
}) => Data(  id: id ?? _id,
  userId: userId ?? _userId,
  productName: productName ?? _productName,
  productId: productId ?? _productId,
  quantity: quantity ?? _quantity,
  price: price ?? _price,
  sizeVarient: sizeVarient ?? _sizeVarient,
  colorVarient: colorVarient ?? _colorVarient,
  createdOn: createdOn ?? _createdOn,
  createdBy: createdBy ?? _createdBy,
  updatedOn: updatedOn ?? _updatedOn,
  updatedBy: updatedBy ?? _updatedBy,
  deleteFlag: deleteFlag ?? _deleteFlag,
  image: image ?? _image,
);
  num? get id => _id;
  num? get userId => _userId;
  String? get productName => _productName;
  num? get productId => _productId;
  num? get quantity => _quantity;
  String? get price => _price;
  dynamic get sizeVarient => _sizeVarient;
  dynamic get colorVarient => _colorVarient;
  String? get createdOn => _createdOn;
  dynamic get createdBy => _createdBy;
  String? get updatedOn => _updatedOn;
  dynamic get updatedBy => _updatedBy;
  num? get deleteFlag => _deleteFlag;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['userId'] = _userId;
    map['productName'] = _productName;
    map['productId'] = _productId;
    map['quantity'] = _quantity;
    map['price'] = _price;
    map['sizeVarient'] = _sizeVarient;
    map['colorVarient'] = _colorVarient;
    map['createdOn'] = _createdOn;
    map['createdBy'] = _createdBy;
    map['updatedOn'] = _updatedOn;
    map['updatedBy'] = _updatedBy;
    map['deleteFlag'] = _deleteFlag;
    map['image'] = _image;
    return map;
  }

}