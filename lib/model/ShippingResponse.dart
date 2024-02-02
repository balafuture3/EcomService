/// status : true
/// message : "Success"
/// data : [{"id":2,"userId":10007,"address":"TN Palayam1","name":"My Home1","city":"Coimbatore1","state":"TamilNadu1","country":"India1","zipcode":"642006","defaultAddress":0},{"id":3,"userId":10007,"address":"TN Palayam1","name":"My Home1","city":"Coimbatore1","state":"TamilNadu1","country":"India1","zipcode":"642006","defaultAddress":0},{"id":4,"userId":10007,"address":"TN Palayam","name":"My Home2","city":"Coimbatore","state":"TamilNadu","country":"India","zipcode":"642005","defaultAddress":0},{"id":5,"userId":10007,"address":"TN Palayam","name":"My Home3","city":"Coimbatore","state":"TamilNadu","country":"India","zipcode":"642005","defaultAddress":1}]

class ShippingResponse {
  ShippingResponse({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  ShippingResponse.fromJson(dynamic json) {
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
ShippingResponse copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => ShippingResponse(  status: status ?? _status,
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

/// id : 2
/// userId : 10007
/// address : "TN Palayam1"
/// name : "My Home1"
/// city : "Coimbatore1"
/// state : "TamilNadu1"
/// country : "India1"
/// zipcode : "642006"
/// defaultAddress : 0

class Data {
  Data({
      num? id, 
      num? userId, 
      String? address, 
      String? name, 
      String? city, 
      String? state, 
      String? country, 
      String? zipcode, 
      num? defaultAddress,}){
    _id = id;
    _userId = userId;
    _address = address;
    _name = name;
    _city = city;
    _state = state;
    _country = country;
    _zipcode = zipcode;
    _defaultAddress = defaultAddress;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['userId'];
    _address = json['address'];
    _name = json['name'];
    _city = json['city'];
    _state = json['state'];
    _country = json['country'];
    _zipcode = json['zipcode'];
    _defaultAddress = json['defaultAddress'];
  }
  num? _id;
  num? _userId;
  String? _address;
  String? _name;
  String? _city;
  String? _state;
  String? _country;
  String? _zipcode;
  num? _defaultAddress;
Data copyWith({  num? id,
  num? userId,
  String? address,
  String? name,
  String? city,
  String? state,
  String? country,
  String? zipcode,
  num? defaultAddress,
}) => Data(  id: id ?? _id,
  userId: userId ?? _userId,
  address: address ?? _address,
  name: name ?? _name,
  city: city ?? _city,
  state: state ?? _state,
  country: country ?? _country,
  zipcode: zipcode ?? _zipcode,
  defaultAddress: defaultAddress ?? _defaultAddress,
);
  num? get id => _id;
  num? get userId => _userId;
  String? get address => _address;
  String? get name => _name;
  String? get city => _city;
  String? get state => _state;
  String? get country => _country;
  String? get zipcode => _zipcode;
  num? get defaultAddress => _defaultAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['userId'] = _userId;
    map['address'] = _address;
    map['name'] = _name;
    map['city'] = _city;
    map['state'] = _state;
    map['country'] = _country;
    map['zipcode'] = _zipcode;
    map['defaultAddress'] = _defaultAddress;
    return map;
  }

}