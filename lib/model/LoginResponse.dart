import 'package:equatable/equatable.dart';

/// status : true
/// message : "Success"
/// data : {"id":10000,"name":"balatest","email":"bala.future3@gmail.com","mobileNumber":"7418230370","categoryId":1,"password":"Password@123","address":"ZaminMuthur","latitude":"10.67521200","longitude":"76.96882200","profilePhoto":"uploads/biriyani.jpg","firebaseId":"1213","createdBy":10000,"createdOn":"2023-10-28T01:38:38.000Z","updatedBy":10000,"updatedOn":"2023-12-26T04:22:13.000Z","deleteFlag":0}

class LoginResponse extends Equatable {
  LoginResponse({
    bool? status,
    String? message,
    Data? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  LoginResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
  LoginResponse copyWith({
    bool? status,
    String? message,
    Data? data,
  }) =>
      LoginResponse(
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
      );
  bool? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

/// id : 10000
/// name : "balatest"
/// email : "bala.future3@gmail.com"
/// mobileNumber : "7418230370"
/// categoryId : 1
/// password : "Password@123"
/// address : "ZaminMuthur"
/// latitude : "10.67521200"
/// longitude : "76.96882200"
/// profilePhoto : "uploads/biriyani.jpg"
/// firebaseId : "1213"
/// createdBy : 10000
/// createdOn : "2023-10-28T01:38:38.000Z"
/// updatedBy : 10000
/// updatedOn : "2023-12-26T04:22:13.000Z"
/// deleteFlag : 0

class Data {
  Data({
    num? id,
    String? name,
    String? email,
    String? mobileNumber,
    num? categoryId,
    String? password,
    String? address,
    String? latitude,
    String? longitude,
    String? profilePhoto,
    String? firebaseId,
    num? createdBy,
    String? createdOn,
    num? updatedBy,
    String? updatedOn,
    num? deleteFlag,
  }) {
    _id = id;
    _name = name;
    _email = email;
    _mobileNumber = mobileNumber;
    _categoryId = categoryId;
    _password = password;
    _address = address;
    _latitude = latitude;
    _longitude = longitude;
    _profilePhoto = profilePhoto;
    _firebaseId = firebaseId;
    _createdBy = createdBy;
    _createdOn = createdOn;
    _updatedBy = updatedBy;
    _updatedOn = updatedOn;
    _deleteFlag = deleteFlag;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _mobileNumber = json['mobileNumber'];
    _categoryId = json['categoryId'];
    _password = json['password'];
    _address = json['address'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _profilePhoto = json['profilePhoto'];
    _firebaseId = json['firebaseId'];
    _createdBy = json['createdBy'];
    _createdOn = json['createdOn'];
    _updatedBy = json['updatedBy'];
    _updatedOn = json['updatedOn'];
    _deleteFlag = json['deleteFlag'];
  }
  num? _id;
  String? _name;
  String? _email;
  String? _mobileNumber;
  num? _categoryId;
  String? _password;
  String? _address;
  String? _latitude;
  String? _longitude;
  String? _profilePhoto;
  String? _firebaseId;
  num? _createdBy;
  String? _createdOn;
  num? _updatedBy;
  String? _updatedOn;
  num? _deleteFlag;
  Data copyWith({
    num? id,
    String? name,
    String? email,
    String? mobileNumber,
    num? categoryId,
    String? password,
    String? address,
    String? latitude,
    String? longitude,
    String? profilePhoto,
    String? firebaseId,
    num? createdBy,
    String? createdOn,
    num? updatedBy,
    String? updatedOn,
    num? deleteFlag,
  }) =>
      Data(
        id: id ?? _id,
        name: name ?? _name,
        email: email ?? _email,
        mobileNumber: mobileNumber ?? _mobileNumber,
        categoryId: categoryId ?? _categoryId,
        password: password ?? _password,
        address: address ?? _address,
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
        profilePhoto: profilePhoto ?? _profilePhoto,
        firebaseId: firebaseId ?? _firebaseId,
        createdBy: createdBy ?? _createdBy,
        createdOn: createdOn ?? _createdOn,
        updatedBy: updatedBy ?? _updatedBy,
        updatedOn: updatedOn ?? _updatedOn,
        deleteFlag: deleteFlag ?? _deleteFlag,
      );
  num? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get mobileNumber => _mobileNumber;
  num? get categoryId => _categoryId;
  String? get password => _password;
  String? get address => _address;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get profilePhoto => _profilePhoto;
  String? get firebaseId => _firebaseId;
  num? get createdBy => _createdBy;
  String? get createdOn => _createdOn;
  num? get updatedBy => _updatedBy;
  String? get updatedOn => _updatedOn;
  num? get deleteFlag => _deleteFlag;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['mobileNumber'] = _mobileNumber;
    map['categoryId'] = _categoryId;
    map['password'] = _password;
    map['address'] = _address;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['profilePhoto'] = _profilePhoto;
    map['firebaseId'] = _firebaseId;
    map['createdBy'] = _createdBy;
    map['createdOn'] = _createdOn;
    map['updatedBy'] = _updatedBy;
    map['updatedOn'] = _updatedOn;
    map['deleteFlag'] = _deleteFlag;
    return map;
  }
}
