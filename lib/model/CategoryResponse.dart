/// status : true
/// message : "Success"
/// master : [{"name":"Electronics","image":"letter-b-logo.png","description":"All Mobiles,Laptops,Headphones etc","id":1},{"name":"Food","image":"pngwing.com.png","description":"All South Indian,Chineese,Fast food etc","id":2},{"name":"Grocery","image":"Grocery.png","description":"Essentials needed every day, like spices, daals, sugar, coffee powder, salt, etc","id":3}]
/// secondary : [{"name":"Mobiles","image":"Electronics.png","description":"All Mobiles with touch screen, keypad etc","id":1,"cat1id":1},{"name":"Biriyani","image":"sa.png","description":"All Mobiles with touch screen, keypad etc","id":2,"cat1id":2},{"name":"Mobiles","image":"sa.png","description":"All Mobiles with touch screen, keypad etc","id":3,"cat1id":1},{"name":"Detergents","image":"Grocery.png","description":"All house products","id":4,"cat1id":3}]
/// primary : [{"name":"Touch Screen mobiles","image":"under-construction.webp","description":"All brands including sony,moto etc","id":1,"cat2id":1,"cat1id":1},{"name":"Arafa","image":"under-construction.webp","description":"All nonveg","id":2,"cat2id":1,"cat1id":2}]

class CategoryResponse {
  CategoryResponse({
      bool? status, 
      String? message, 
      List<Master>? master, 
      List<Secondary>? secondary, 
      List<Primary>? primary,}){
    _status = status;
    _message = message;
    _master = master;
    _secondary = secondary;
    _primary = primary;
}

  CategoryResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['master'] != null) {
      _master = [];
      json['master'].forEach((v) {
        _master?.add(Master.fromJson(v));
      });
    }
    if (json['secondary'] != null) {
      _secondary = [];
      json['secondary'].forEach((v) {
        _secondary?.add(Secondary.fromJson(v));
      });
    }
    if (json['primary'] != null) {
      _primary = [];
      json['primary'].forEach((v) {
        _primary?.add(Primary.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<Master>? _master;
  List<Secondary>? _secondary;
  List<Primary>? _primary;
CategoryResponse copyWith({  bool? status,
  String? message,
  List<Master>? master,
  List<Secondary>? secondary,
  List<Primary>? primary,
}) => CategoryResponse(  status: status ?? _status,
  message: message ?? _message,
  master: master ?? _master,
  secondary: secondary ?? _secondary,
  primary: primary ?? _primary,
);
  bool? get status => _status;
  String? get message => _message;
  List<Master>? get master => _master;
  List<Secondary>? get secondary => _secondary;
  List<Primary>? get primary => _primary;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_master != null) {
      map['master'] = _master?.map((v) => v.toJson()).toList();
    }
    if (_secondary != null) {
      map['secondary'] = _secondary?.map((v) => v.toJson()).toList();
    }
    if (_primary != null) {
      map['primary'] = _primary?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "Touch Screen mobiles"
/// image : "under-construction.webp"
/// description : "All brands including sony,moto etc"
/// id : 1
/// cat2id : 1
/// cat1id : 1

class Primary {
  Primary({
      String? name, 
      String? image, 
      String? description, 
      num? id, 
      num? cat2id, 
      num? cat1id,}){
    _name = name;
    _image = image;
    _description = description;
    _id = id;
    _cat2id = cat2id;
    _cat1id = cat1id;
}

  Primary.fromJson(dynamic json) {
    _name = json['name'];
    _image = json['image'];
    _description = json['description'];
    _id = json['id'];
    _cat2id = json['cat2id'];
    _cat1id = json['cat1id'];
  }
  String? _name;
  String? _image;
  String? _description;
  num? _id;
  num? _cat2id;
  num? _cat1id;
Primary copyWith({  String? name,
  String? image,
  String? description,
  num? id,
  num? cat2id,
  num? cat1id,
}) => Primary(  name: name ?? _name,
  image: image ?? _image,
  description: description ?? _description,
  id: id ?? _id,
  cat2id: cat2id ?? _cat2id,
  cat1id: cat1id ?? _cat1id,
);
  String? get name => _name;
  String? get image => _image;
  String? get description => _description;
  num? get id => _id;
  num? get cat2id => _cat2id;
  num? get cat1id => _cat1id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['image'] = _image;
    map['description'] = _description;
    map['id'] = _id;
    map['cat2id'] = _cat2id;
    map['cat1id'] = _cat1id;
    return map;
  }

}

/// name : "Mobiles"
/// image : "Electronics.png"
/// description : "All Mobiles with touch screen, keypad etc"
/// id : 1
/// cat1id : 1

class Secondary {
  Secondary({
      String? name, 
      String? image, 
      String? description, 
      num? id, 
      num? cat1id,}){
    _name = name;
    _image = image;
    _description = description;
    _id = id;
    _cat1id = cat1id;
}

  Secondary.fromJson(dynamic json) {
    _name = json['name'];
    _image = json['image'];
    _description = json['description'];
    _id = json['id'];
    _cat1id = json['cat1id'];
  }
  String? _name;
  String? _image;
  String? _description;
  num? _id;
  num? _cat1id;
Secondary copyWith({  String? name,
  String? image,
  String? description,
  num? id,
  num? cat1id,
}) => Secondary(  name: name ?? _name,
  image: image ?? _image,
  description: description ?? _description,
  id: id ?? _id,
  cat1id: cat1id ?? _cat1id,
);
  String? get name => _name;
  String? get image => _image;
  String? get description => _description;
  num? get id => _id;
  num? get cat1id => _cat1id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['image'] = _image;
    map['description'] = _description;
    map['id'] = _id;
    map['cat1id'] = _cat1id;
    return map;
  }

}

/// name : "Electronics"
/// image : "letter-b-logo.png"
/// description : "All Mobiles,Laptops,Headphones etc"
/// id : 1

class Master {
  Master({
      String? name, 
      String? image, 
      String? description, 
      num? id,}){
    _name = name;
    _image = image;
    _description = description;
    _id = id;
}

  Master.fromJson(dynamic json) {
    _name = json['name'];
    _image = json['image'];
    _description = json['description'];
    _id = json['id'];
  }
  String? _name;
  String? _image;
  String? _description;
  num? _id;
Master copyWith({  String? name,
  String? image,
  String? description,
  num? id,
}) => Master(  name: name ?? _name,
  image: image ?? _image,
  description: description ?? _description,
  id: id ?? _id,
);
  String? get name => _name;
  String? get image => _image;
  String? get description => _description;
  num? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['image'] = _image;
    map['description'] = _description;
    map['id'] = _id;
    return map;
  }

}