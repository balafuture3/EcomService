/// status : true
/// message : "Success"
/// header : [{"id":5,"userId":10007,"orderTotal":"420","paymentId":8,"shippingId":3,"orderStatus":0,"createdOn":"2024-02-01T05:18:07.000Z","promoCode":"newyear2024","promoPercent":"26","trackingId":null,"paymentStatus":1,"address":"TN Palayam1","shippingName":"My Home1","city":"Coimbatore1","state":"TamilNadu1","country":"India1","cvv":"140","cardName":"bala12","expiry":"25/87","cardNo":"1234 1234 1234"}]
/// details : [{"productName":"Apple laptop","productId":4,"quantity":1,"price":"500.00","image":"under-construction.webp","sizeVarient":"","colorVarient":"","id":5}]

class OrderDetailResponse {
  OrderDetailResponse({
      bool? status, 
      String? message, 
      List<Header>? header, 
      List<Details>? details,}){
    _status = status;
    _message = message;
    _header = header;
    _details = details;
}

  OrderDetailResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['header'] != null) {
      _header = [];
      json['header'].forEach((v) {
        _header?.add(Header.fromJson(v));
      });
    }
    if (json['details'] != null) {
      _details = [];
      json['details'].forEach((v) {
        _details?.add(Details.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<Header>? _header;
  List<Details>? _details;
OrderDetailResponse copyWith({  bool? status,
  String? message,
  List<Header>? header,
  List<Details>? details,
}) => OrderDetailResponse(  status: status ?? _status,
  message: message ?? _message,
  header: header ?? _header,
  details: details ?? _details,
);
  bool? get status => _status;
  String? get message => _message;
  List<Header>? get header => _header;
  List<Details>? get details => _details;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_header != null) {
      map['header'] = _header?.map((v) => v.toJson()).toList();
    }
    if (_details != null) {
      map['details'] = _details?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// productName : "Apple laptop"
/// productId : 4
/// quantity : 1
/// price : "500.00"
/// image : "under-construction.webp"
/// sizeVarient : ""
/// colorVarient : ""
/// id : 5

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

/// id : 5
/// userId : 10007
/// orderTotal : "420"
/// paymentId : 8
/// shippingId : 3
/// orderStatus : 0
/// createdOn : "2024-02-01T05:18:07.000Z"
/// promoCode : "newyear2024"
/// promoPercent : "26"
/// trackingId : null
/// paymentStatus : 1
/// address : "TN Palayam1"
/// shippingName : "My Home1"
/// city : "Coimbatore1"
/// state : "TamilNadu1"
/// country : "India1"
/// cvv : "140"
/// cardName : "bala12"
/// expiry : "25/87"
/// cardNo : "1234 1234 1234"

class Header {
  Header({
      num? id, 
      num? userId, 
      String? orderTotal, 
      num? paymentId, 
      num? shippingId, 
      num? orderStatus, 
      String? createdOn, 
      String? promoCode, 
      String? promoPercent, 
      dynamic trackingId, 
      num? paymentStatus, 
      String? address, 
      String? shippingName, 
      String? city, 
      String? state, 
      String? country, 
      String? cvv, 
      String? cardName, 
      String? expiry, 
      String? cardNo,}){
    _id = id;
    _userId = userId;
    _orderTotal = orderTotal;
    _paymentId = paymentId;
    _shippingId = shippingId;
    _orderStatus = orderStatus;
    _createdOn = createdOn;
    _promoCode = promoCode;
    _promoPercent = promoPercent;
    _trackingId = trackingId;
    _paymentStatus = paymentStatus;
    _address = address;
    _shippingName = shippingName;
    _city = city;
    _state = state;
    _country = country;
    _cvv = cvv;
    _cardName = cardName;
    _expiry = expiry;
    _cardNo = cardNo;
}

  Header.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['userId'];
    _orderTotal = json['orderTotal'];
    _paymentId = json['paymentId'];
    _shippingId = json['shippingId'];
    _orderStatus = json['orderStatus'];
    _createdOn = json['createdOn'];
    _promoCode = json['promoCode'];
    _promoPercent = json['promoPercent'];
    _trackingId = json['trackingId'];
    _paymentStatus = json['paymentStatus'];
    _address = json['address'];
    _shippingName = json['shippingName'];
    _city = json['city'];
    _state = json['state'];
    _country = json['country'];
    _cvv = json['cvv'];
    _cardName = json['cardName'];
    _expiry = json['expiry'];
    _cardNo = json['cardNo'];
  }
  num? _id;
  num? _userId;
  String? _orderTotal;
  num? _paymentId;
  num? _shippingId;
  num? _orderStatus;
  String? _createdOn;
  String? _promoCode;
  String? _promoPercent;
  dynamic _trackingId;
  num? _paymentStatus;
  String? _address;
  String? _shippingName;
  String? _city;
  String? _state;
  String? _country;
  String? _cvv;
  String? _cardName;
  String? _expiry;
  String? _cardNo;
Header copyWith({  num? id,
  num? userId,
  String? orderTotal,
  num? paymentId,
  num? shippingId,
  num? orderStatus,
  String? createdOn,
  String? promoCode,
  String? promoPercent,
  dynamic trackingId,
  num? paymentStatus,
  String? address,
  String? shippingName,
  String? city,
  String? state,
  String? country,
  String? cvv,
  String? cardName,
  String? expiry,
  String? cardNo,
}) => Header(  id: id ?? _id,
  userId: userId ?? _userId,
  orderTotal: orderTotal ?? _orderTotal,
  paymentId: paymentId ?? _paymentId,
  shippingId: shippingId ?? _shippingId,
  orderStatus: orderStatus ?? _orderStatus,
  createdOn: createdOn ?? _createdOn,
  promoCode: promoCode ?? _promoCode,
  promoPercent: promoPercent ?? _promoPercent,
  trackingId: trackingId ?? _trackingId,
  paymentStatus: paymentStatus ?? _paymentStatus,
  address: address ?? _address,
  shippingName: shippingName ?? _shippingName,
  city: city ?? _city,
  state: state ?? _state,
  country: country ?? _country,
  cvv: cvv ?? _cvv,
  cardName: cardName ?? _cardName,
  expiry: expiry ?? _expiry,
  cardNo: cardNo ?? _cardNo,
);
  num? get id => _id;
  num? get userId => _userId;
  String? get orderTotal => _orderTotal;
  num? get paymentId => _paymentId;
  num? get shippingId => _shippingId;
  num? get orderStatus => _orderStatus;
  String? get createdOn => _createdOn;
  String? get promoCode => _promoCode;
  String? get promoPercent => _promoPercent;
  dynamic get trackingId => _trackingId;
  num? get paymentStatus => _paymentStatus;
  String? get address => _address;
  String? get shippingName => _shippingName;
  String? get city => _city;
  String? get state => _state;
  String? get country => _country;
  String? get cvv => _cvv;
  String? get cardName => _cardName;
  String? get expiry => _expiry;
  String? get cardNo => _cardNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['userId'] = _userId;
    map['orderTotal'] = _orderTotal;
    map['paymentId'] = _paymentId;
    map['shippingId'] = _shippingId;
    map['orderStatus'] = _orderStatus;
    map['createdOn'] = _createdOn;
    map['promoCode'] = _promoCode;
    map['promoPercent'] = _promoPercent;
    map['trackingId'] = _trackingId;
    map['paymentStatus'] = _paymentStatus;
    map['address'] = _address;
    map['shippingName'] = _shippingName;
    map['city'] = _city;
    map['state'] = _state;
    map['country'] = _country;
    map['cvv'] = _cvv;
    map['cardName'] = _cardName;
    map['expiry'] = _expiry;
    map['cardNo'] = _cardNo;
    return map;
  }

}