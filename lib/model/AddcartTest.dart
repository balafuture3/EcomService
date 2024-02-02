/// details : [{"productId":4,"quantity":1,"price":"100","productName":"dfwgfr","userId":1,"colorVarient":null,"sizeVarient":null},{"productId":8,"quantity":1,"price":"100","productName":"dfwgfr","userId":1,"colorVarient":"#51FF00","sizeVarient":"S"}]

class AddcartTest {
  AddcartTest({
      List<Details>? details,}){
    _details = details;
}

  AddcartTest.fromJson(dynamic json) {
    if (json['details'] != null) {
      _details = [];
      json['details'].forEach((v) {
        _details?.add(Details.fromJson(v));
      });
    }
  }
  List<Details>? _details;
AddcartTest copyWith({  List<Details>? details,
}) => AddcartTest(  details: details ?? _details,
);
  List<Details>? get details => _details;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_details != null) {
      map['details'] = _details?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// productId : 4
/// quantity : 1
/// price : "100"
/// productName : "dfwgfr"
/// userId : 1
/// colorVarient : null
/// sizeVarient : null

class Details {
  Details({
      num? productId, 
      num? quantity, 
      String? price, 
      String? productName, 
      num? userId, 
      dynamic colorVarient, 
      dynamic sizeVarient,}){
    _productId = productId;
    _quantity = quantity;
    _price = price;
    _productName = productName;
    _userId = userId;
    _colorVarient = colorVarient;
    _sizeVarient = sizeVarient;
}

  Details.fromJson(dynamic json) {
    _productId = json['productId'];
    _quantity = json['quantity'];
    _price = json['price'];
    _productName = json['productName'];
    _userId = json['userId'];
    _colorVarient = json['colorVarient'];
    _sizeVarient = json['sizeVarient'];
  }
  num? _productId;
  num? _quantity;
  String? _price;
  String? _productName;
  num? _userId;
  dynamic _colorVarient;
  dynamic _sizeVarient;
Details copyWith({  num? productId,
  num? quantity,
  String? price,
  String? productName,
  num? userId,
  dynamic colorVarient,
  dynamic sizeVarient,
}) => Details(  productId: productId ?? _productId,
  quantity: quantity ?? _quantity,
  price: price ?? _price,
  productName: productName ?? _productName,
  userId: userId ?? _userId,
  colorVarient: colorVarient ?? _colorVarient,
  sizeVarient: sizeVarient ?? _sizeVarient,
);
  num? get productId => _productId;
  num? get quantity => _quantity;
  String? get price => _price;
  String? get productName => _productName;
  num? get userId => _userId;
  dynamic get colorVarient => _colorVarient;
  dynamic get sizeVarient => _sizeVarient;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productId'] = _productId;
    map['quantity'] = _quantity;
    map['price'] = _price;
    map['productName'] = _productName;
    map['userId'] = _userId;
    map['colorVarient'] = _colorVarient;
    map['sizeVarient'] = _sizeVarient;
    return map;
  }

}