/// userId : 10002
/// orderTotal : 10000
/// paymentId : 1
/// shippingId : 1
/// paymentStatus : 0
/// details : [{"productId":0,"quantity":1,"price":"100","productName":"1"},{"productId":1,"quantity":1,"price":"101","productName":"2"}]
/// createdBy : "1234"
/// updatedBy : "1234"

class PlaceOrderRequest {
  PlaceOrderRequest({
      num? userId, 
      num? orderTotal, 
      num? paymentId, 
      num? shippingId, 
      num? paymentStatus, 
      List<Details>? details, 
      String? createdBy, 
      String? updatedBy,}){
    _userId = userId;
    _orderTotal = orderTotal;
    _paymentId = paymentId;
    _shippingId = shippingId;
    _paymentStatus = paymentStatus;
    _details = details;
    _createdBy = createdBy;
    _updatedBy = updatedBy;
}

  PlaceOrderRequest.fromJson(dynamic json) {
    _userId = json['userId'];
    _orderTotal = json['orderTotal'];
    _paymentId = json['paymentId'];
    _shippingId = json['shippingId'];
    _paymentStatus = json['paymentStatus'];
    if (json['details'] != null) {
      _details = [];
      json['details'].forEach((v) {
        _details?.add(Details.fromJson(v));
      });
    }
    _createdBy = json['createdBy'];
    _updatedBy = json['updatedBy'];
  }
  num? _userId;
  num? _orderTotal;
  num? _paymentId;
  num? _shippingId;
  num? _paymentStatus;
  List<Details>? _details;
  String? _createdBy;
  String? _updatedBy;
PlaceOrderRequest copyWith({  num? userId,
  num? orderTotal,
  num? paymentId,
  num? shippingId,
  num? paymentStatus,
  List<Details>? details,
  String? createdBy,
  String? updatedBy,
}) => PlaceOrderRequest(  userId: userId ?? _userId,
  orderTotal: orderTotal ?? _orderTotal,
  paymentId: paymentId ?? _paymentId,
  shippingId: shippingId ?? _shippingId,
  paymentStatus: paymentStatus ?? _paymentStatus,
  details: details ?? _details,
  createdBy: createdBy ?? _createdBy,
  updatedBy: updatedBy ?? _updatedBy,
);
  num? get userId => _userId;
  num? get orderTotal => _orderTotal;
  num? get paymentId => _paymentId;
  num? get shippingId => _shippingId;
  num? get paymentStatus => _paymentStatus;
  List<Details>? get details => _details;
  String? get createdBy => _createdBy;
  String? get updatedBy => _updatedBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['orderTotal'] = _orderTotal;
    map['paymentId'] = _paymentId;
    map['shippingId'] = _shippingId;
    map['paymentStatus'] = _paymentStatus;
    if (_details != null) {
      map['details'] = _details?.map((v) => v.toJson()).toList();
    }
    map['createdBy'] = _createdBy;
    map['updatedBy'] = _updatedBy;
    return map;
  }

}

/// productId : 0
/// quantity : 1
/// price : "100"
/// productName : "1"

class Details {
  Details({
    String? productName,
    num? productId,
    num? quantity,
    String? price,
    String? image,
    String? sizeVarient,
    String? colorVarient,
    num? id,}){
    _productName = productName;
    _productId = productId;
    _quantity = quantity;
    _price = price;
    _image = image;
    _sizeVarient = sizeVarient;
    _colorVarient = colorVarient;
    _id = id;
  }

  Details.fromJson(dynamic json) {
    _productName = json['productName'];
    _productId = json['productId'];
    _quantity = json['quantity'];
    _price = json['price'];
    _image = json['image'];
    _sizeVarient = json['sizeVarient'];
    _colorVarient = json['colorVarient'];
    _id = json['id'];
  }
  String? _productName;
  num? _productId;
  num? _quantity;
  String? _price;
  String? _image;
  String? _sizeVarient;
  String? _colorVarient;
  num? _id;
  Details copyWith({  String? productName,
    num? productId,
    num? quantity,
    String? price,
    String? image,
    String? sizeVarient,
    String? colorVarient,
    num? id,
  }) => Details(  productName: productName ?? _productName,
    productId: productId ?? _productId,
    quantity: quantity ?? _quantity,
    price: price ?? _price,
    image: image ?? _image,
    sizeVarient: sizeVarient ?? _sizeVarient,
    colorVarient: colorVarient ?? _colorVarient,
    id: id ?? _id,
  );
  String? get productName => _productName;
  num? get productId => _productId;
  num? get quantity => _quantity;
  String? get price => _price;
  String? get image => _image;
  String? get sizeVarient => _sizeVarient;
  String? get colorVarient => _colorVarient;
  num? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productName'] = _productName;
    map['productId'] = _productId;
    map['quantity'] = _quantity;
    map['price'] = _price;
    map['image'] = _image;
    map['sizeVarient'] = _sizeVarient;
    map['colorVarient'] = _colorVarient;
    map['id'] = _id;
    return map;
  }

}