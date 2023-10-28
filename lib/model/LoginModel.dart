/// id : "726"
/// temp : "31,72"
/// location : "0.000000,0.000000"

class LoginModel {
  LoginModel({
      String? id,
      String? temp,
      String? location,}){
    _id = id;
    _temp = temp;
    _location = location;
}

  LoginModel.fromJson(dynamic json) {
    _id = json['id'];
    _temp = json['temp'];
    _location = json['location'];
  }
  String? _id;
  String? _temp;
  String? _location;
LoginModel copyWith({  String? id,
  String? temp,
  String? location,
}) => LoginModel(  id: id ?? _id,
  temp: temp ?? _temp,
  location: location ?? _location,
);
  String? get id => _id;
  String? get temp => _temp;
  String? get location => _location;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['temp'] = _temp;
    map['location'] = _location;
    return map;
  }

}