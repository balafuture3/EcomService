/// status : true
/// message : "Success"
/// data : [{"id":1,"name":"Year Offer","image":"","description":"newyear2024","percent":"26","active":1},{"id":2,"name":"Promo2","image":"","description":"promotxt","percent":"30","active":1},{"id":3,"name":"testpromo","image":"1000017365.png","description":"undefined","percent":"66","active":1}]

class PromoResponse {
  PromoResponse({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  PromoResponse.fromJson(dynamic json) {
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
PromoResponse copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => PromoResponse(  status: status ?? _status,
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
/// name : "Year Offer"
/// image : ""
/// description : "newyear2024"
/// percent : "26"
/// active : 1

class Data {
  Data({
      num? id, 
      String? name, 
      String? image, 
      String? description, 
      String? percent, 
      num? active,}){
    _id = id;
    _name = name;
    _image = image;
    _description = description;
    _percent = percent;
    _active = active;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _description = json['description'];
    _percent = json['percent'];
    _active = json['active'];
  }
  num? _id;
  String? _name;
  String? _image;
  String? _description;
  String? _percent;
  num? _active;
Data copyWith({  num? id,
  String? name,
  String? image,
  String? description,
  String? percent,
  num? active,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
  description: description ?? _description,
  percent: percent ?? _percent,
  active: active ?? _active,
);
  num? get id => _id;
  String? get name => _name;
  String? get image => _image;
  String? get description => _description;
  String? get percent => _percent;
  num? get active => _active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['description'] = _description;
    map['percent'] = _percent;
    map['active'] = _active;
    return map;
  }

}