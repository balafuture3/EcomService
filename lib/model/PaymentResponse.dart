/// status : true
/// message : "Success"
/// data : [{"id":1,"userId":10007,"name":"balapay","cvv":"130","cardNo":"1234 1234 1235","expiry":"2024-11-12T07:53:44.000Z","defaultPayment":0},{"id":2,"userId":10007,"name":"balapay3","cvv":"130","cardNo":"1234 1234 1235","expiry":"2024-11-12T07:53:44.000Z","defaultPayment":0},{"id":3,"userId":10007,"name":"bala2","cvv":"140","cardNo":"1234 1234 1234","expiry":"2024-11-11T07:53:44.000Z","defaultPayment":1},{"id":4,"userId":10007,"name":"bala3","cvv":"140","cardNo":"1234 1234 1234","expiry":"2024-11-11T07:53:44.000Z","defaultPayment":0},{"id":5,"userId":10007,"name":"bala4","cvv":"140","cardNo":"1234 1234 1234","expiry":"2024-11-11T07:53:44.000Z","defaultPayment":0},{"id":6,"userId":10007,"name":"bala5","cvv":"140","cardNo":"1234 1234 1234","expiry":"2024-11-11T07:53:44.000Z","defaultPayment":0},{"id":7,"userId":10007,"name":"bala7","cvv":"140","cardNo":"1234 1234 1234","expiry":"2024-11-11T07:53:44.000Z","defaultPayment":0},{"id":8,"userId":10007,"name":"bala10","cvv":"140","cardNo":"1234 1234 1234","expiry":"2024-11-11T07:53:44.000Z","defaultPayment":0}]

class PaymentResponse {
  PaymentResponse({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  PaymentResponse.fromJson(dynamic json) {
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
PaymentResponse copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => PaymentResponse(  status: status ?? _status,
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

/// id : 1
/// userId : 10007
/// name : "balapay"
/// cvv : "130"
/// cardNo : "1234 1234 1235"
/// expiry : "2024-11-12T07:53:44.000Z"
/// defaultPayment : 0

class Data {
  Data({
      num? id, 
      num? userId, 
      String? name, 
      String? cvv, 
      String? cardNo, 
      String? expiry, 
      num? defaultPayment,}){
    _id = id;
    _userId = userId;
    _name = name;
    _cvv = cvv;
    _cardNo = cardNo;
    _expiry = expiry;
    _defaultPayment = defaultPayment;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['userId'];
    _name = json['name'];
    _cvv = json['cvv'];
    _cardNo = json['cardNo'];
    _expiry = json['expiry'];
    _defaultPayment = json['defaultPayment'];
  }
  num? _id;
  num? _userId;
  String? _name;
  String? _cvv;
  String? _cardNo;
  String? _expiry;
  num? _defaultPayment;
Data copyWith({  num? id,
  num? userId,
  String? name,
  String? cvv,
  String? cardNo,
  String? expiry,
  num? defaultPayment,
}) => Data(  id: id ?? _id,
  userId: userId ?? _userId,
  name: name ?? _name,
  cvv: cvv ?? _cvv,
  cardNo: cardNo ?? _cardNo,
  expiry: expiry ?? _expiry,
  defaultPayment: defaultPayment ?? _defaultPayment,
);
  num? get id => _id;
  num? get userId => _userId;
  String? get name => _name;
  String? get cvv => _cvv;
  String? get cardNo => _cardNo;
  String? get expiry => _expiry;
  num? get defaultPayment => _defaultPayment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['userId'] = _userId;
    map['name'] = _name;
    map['cvv'] = _cvv;
    map['cardNo'] = _cardNo;
    map['expiry'] = _expiry;
    map['defaultPayment'] = _defaultPayment;
    return map;
  }

}