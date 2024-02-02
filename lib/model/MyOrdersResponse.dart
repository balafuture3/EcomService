/// status : true
/// message : "Success"
/// data : [{"id":18,"userId":10007,"orderTotal":"2050","paymentId":8,"shippingId":3,"orderStatus":0,"createdOn":"2024-01-27T04:26:33.000Z","trackingId":null,"paymentStatus":1,"address":"TN Palayam1","shippingName":"My Home1","city":"Coimbatore1","state":"TamilNadu1","country":"India1","cvv":"140","cardName":"bala12","expiry":"25/87","cardNo":"1234 1234 1234","itemCount":2},{"id":19,"userId":10007,"orderTotal":"2450","paymentId":8,"shippingId":3,"orderStatus":0,"createdOn":"2024-01-27T04:44:18.000Z","trackingId":null,"paymentStatus":1,"address":"TN Palayam1","shippingName":"My Home1","city":"Coimbatore1","state":"TamilNadu1","country":"India1","cvv":"140","cardName":"bala12","expiry":"25/87","cardNo":"1234 1234 1234","itemCount":3},{"id":20,"userId":10007,"orderTotal":"2450","paymentId":9,"shippingId":3,"orderStatus":0,"createdOn":"2024-01-28T23:00:41.000Z","trackingId":null,"paymentStatus":1,"address":"TN Palayam1","shippingName":"My Home1","city":"Coimbatore1","state":"TamilNadu1","country":"India1","cvv":"343","cardName":"test","expiry":"23/43","cardNo":"1232 3434 3434 3434","itemCount":3},{"id":21,"userId":10007,"orderTotal":"2450","paymentId":9,"shippingId":3,"orderStatus":0,"createdOn":"2024-01-28T23:09:23.000Z","trackingId":null,"paymentStatus":1,"address":"TN Palayam1","shippingName":"My Home1","city":"Coimbatore1","state":"TamilNadu1","country":"India1","cvv":"343","cardName":"test","expiry":"23/43","cardNo":"1232 3434 3434 3434","itemCount":3}]

class MyOrdersResponse {
  MyOrdersResponse({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  MyOrdersResponse.fromJson(dynamic json) {
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
MyOrdersResponse copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => MyOrdersResponse(  status: status ?? _status,
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

/// id : 18
/// userId : 10007
/// orderTotal : "2050"
/// paymentId : 8
/// shippingId : 3
/// orderStatus : 0
/// createdOn : "2024-01-27T04:26:33.000Z"
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
/// itemCount : 2

class Data {
  Data({
      num? id, 
      num? userId, 
      String? orderTotal, 
      num? paymentId, 
      num? shippingId, 
      num? orderStatus, 
      String? createdOn, 
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
      num? itemCount,}){
    _id = id;
    _userId = userId;
    _orderTotal = orderTotal;
    _paymentId = paymentId;
    _shippingId = shippingId;
    _orderStatus = orderStatus;
    _createdOn = createdOn;
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
    _itemCount = itemCount;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['userId'];
    _orderTotal = json['orderTotal'];
    _paymentId = json['paymentId'];
    _shippingId = json['shippingId'];
    _orderStatus = json['orderStatus'];
    _createdOn = json['createdOn'];
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
    _itemCount = json['itemCount'];
  }
  num? _id;
  num? _userId;
  String? _orderTotal;
  num? _paymentId;
  num? _shippingId;
  num? _orderStatus;
  String? _createdOn;
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
  num? _itemCount;
Data copyWith({  num? id,
  num? userId,
  String? orderTotal,
  num? paymentId,
  num? shippingId,
  num? orderStatus,
  String? createdOn,
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
  num? itemCount,
}) => Data(  id: id ?? _id,
  userId: userId ?? _userId,
  orderTotal: orderTotal ?? _orderTotal,
  paymentId: paymentId ?? _paymentId,
  shippingId: shippingId ?? _shippingId,
  orderStatus: orderStatus ?? _orderStatus,
  createdOn: createdOn ?? _createdOn,
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
  itemCount: itemCount ?? _itemCount,
);
  num? get id => _id;
  num? get userId => _userId;
  String? get orderTotal => _orderTotal;
  num? get paymentId => _paymentId;
  num? get shippingId => _shippingId;
  num? get orderStatus => _orderStatus;
  String? get createdOn => _createdOn;
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
  num? get itemCount => _itemCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['userId'] = _userId;
    map['orderTotal'] = _orderTotal;
    map['paymentId'] = _paymentId;
    map['shippingId'] = _shippingId;
    map['orderStatus'] = _orderStatus;
    map['createdOn'] = _createdOn;
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
    map['itemCount'] = _itemCount;
    return map;
  }

}