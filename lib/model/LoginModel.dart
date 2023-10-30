/// status : true
/// message : "success"
/// data : {"id":"10001","name":"bala1","email":"bala.future1@gmail.com","mobileNumber":"7418230371","categoryId":"1","password":"e10adc3949ba59abbe56e057f20f883e","address":"ZaminMuthur","latitude":"10.67521200","longitude":"76.96882200","profilePhoto":"uploads/dosa.jpg","firebaseId":"","createdBy":"10000","createdOn":"2023-10-28 01:07:28","updatedBy":"10000","updatedOn":"2023-10-28 01:08:09","deleteFlag":"0"}

class LoginModel {
  LoginModel({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  LoginModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
LoginModel copyWith({  bool? status,
  String? message,
  Data? data,
}) => LoginModel(  status: status ?? _status,
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

}

/// id : "10001"
/// name : "bala1"
/// email : "bala.future1@gmail.com"
/// mobileNumber : "7418230371"
/// categoryId : "1"
/// password : "e10adc3949ba59abbe56e057f20f883e"
/// address : "ZaminMuthur"
/// latitude : "10.67521200"
/// longitude : "76.96882200"
/// profilePhoto : "uploads/dosa.jpg"
/// firebaseId : ""
/// createdBy : "10000"
/// createdOn : "2023-10-28 01:07:28"
/// updatedBy : "10000"
/// updatedOn : "2023-10-28 01:08:09"
/// deleteFlag : "0"

class Data {
  Data({
      String? id, 
      String? name, 
      String? email, 
      String? mobileNumber, 
      String? categoryId, 
      String? password, 
      String? address, 
      String? latitude, 
      String? longitude, 
      String? profilePhoto, 
      String? firebaseId, 
      String? createdBy, 
      String? createdOn, 
      String? updatedBy, 
      String? updatedOn, 
      String? deleteFlag,}){
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
  String? _id;
  String? _name;
  String? _email;
  String? _mobileNumber;
  String? _categoryId;
  String? _password;
  String? _address;
  String? _latitude;
  String? _longitude;
  String? _profilePhoto;
  String? _firebaseId;
  String? _createdBy;
  String? _createdOn;
  String? _updatedBy;
  String? _updatedOn;
  String? _deleteFlag;
Data copyWith({  String? id,
  String? name,
  String? email,
  String? mobileNumber,
  String? categoryId,
  String? password,
  String? address,
  String? latitude,
  String? longitude,
  String? profilePhoto,
  String? firebaseId,
  String? createdBy,
  String? createdOn,
  String? updatedBy,
  String? updatedOn,
  String? deleteFlag,
}) => Data(  id: id ?? _id,
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
  String? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get mobileNumber => _mobileNumber;
  String? get categoryId => _categoryId;
  String? get password => _password;
  String? get address => _address;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get profilePhoto => _profilePhoto;
  String? get firebaseId => _firebaseId;
  String? get createdBy => _createdBy;
  String? get createdOn => _createdOn;
  String? get updatedBy => _updatedBy;
  String? get updatedOn => _updatedOn;
  String? get deleteFlag => _deleteFlag;

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