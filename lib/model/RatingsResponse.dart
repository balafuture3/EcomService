/// status : true
/// message : "Success"
/// data : [{"name":"bala","profilePhoto":"image_picker_539ED045-E87E-469D-AAF2-2E353D6FB6A9-11691-000000217E604072.jpg","id":7,"ratings":"5.0","productId":4,"image":"ecommerce-platform-data-1.webp","comments":"Very Good Product","createdOn":"2024-02-01T07:17:41.000Z","createdBy":10007,"updatedOn":"2024-02-01T07:17:41.000Z","updatedBy":null,"deleteFlag":0},{"name":"bala","profilePhoto":"image_picker_539ED045-E87E-469D-AAF2-2E353D6FB6A9-11691-000000217E604072.jpg","id":12,"ratings":"2.0","productId":4,"image":"image_picker_2D00FAE1-9943-4040-A659-D50E4E78E1F7-11691-00000034B4D9CEF8.jpg;image_picker_90590DE5-6A14-424F-A810-340BBA960A9C-11691-00000034B86FFA7C.jpg","comments":"test","createdOn":"2024-02-01T12:14:14.000Z","createdBy":10007,"updatedOn":"2024-02-01T12:14:14.000Z","updatedBy":null,"deleteFlag":0},{"name":"bala","profilePhoto":"image_picker_539ED045-E87E-469D-AAF2-2E353D6FB6A9-11691-000000217E604072.jpg","id":14,"ratings":"5.0","productId":4,"image":"sa.png;ecommerce-platform-data-1.webp","comments":"Very Good Product","createdOn":"2024-02-02T04:57:17.000Z","createdBy":10007,"updatedOn":"2024-02-02T04:57:17.000Z","updatedBy":null,"deleteFlag":0}]
/// rating : [{"rating_5":"2","rating_4":"0","rating_3":"0","rating_2":"1","rating_1":"0","rating_0":"0"}]

class RatingsResponse {
  RatingsResponse({
      bool? status, 
      String? message, 
      List<Data>? data, 
      List<Rating>? rating,}){
    _status = status;
    _message = message;
    _data = data;
    _rating = rating;
}

  RatingsResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    if (json['rating'] != null) {
      _rating = [];
      json['rating'].forEach((v) {
        _rating?.add(Rating.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<Data>? _data;
  List<Rating>? _rating;
RatingsResponse copyWith({  bool? status,
  String? message,
  List<Data>? data,
  List<Rating>? rating,
}) => RatingsResponse(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
  rating: rating ?? _rating,
);
  bool? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;
  List<Rating>? get rating => _rating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_rating != null) {
      map['rating'] = _rating?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// rating_5 : "2"
/// rating_4 : "0"
/// rating_3 : "0"
/// rating_2 : "1"
/// rating_1 : "0"
/// rating_0 : "0"

class Rating {
  Rating({
      String? rating5, 
      String? rating4, 
      String? rating3, 
      String? rating2, 
      String? rating1, 
      String? rating0,}){
    _rating5 = rating5;
    _rating4 = rating4;
    _rating3 = rating3;
    _rating2 = rating2;
    _rating1 = rating1;
    _rating0 = rating0;
}

  Rating.fromJson(dynamic json) {
    _rating5 = json['rating_5'];
    _rating4 = json['rating_4'];
    _rating3 = json['rating_3'];
    _rating2 = json['rating_2'];
    _rating1 = json['rating_1'];
    _rating0 = json['rating_0'];
  }
  String? _rating5;
  String? _rating4;
  String? _rating3;
  String? _rating2;
  String? _rating1;
  String? _rating0;
Rating copyWith({  String? rating5,
  String? rating4,
  String? rating3,
  String? rating2,
  String? rating1,
  String? rating0,
}) => Rating(  rating5: rating5 ?? _rating5,
  rating4: rating4 ?? _rating4,
  rating3: rating3 ?? _rating3,
  rating2: rating2 ?? _rating2,
  rating1: rating1 ?? _rating1,
  rating0: rating0 ?? _rating0,
);
  String? get rating5 => _rating5;
  String? get rating4 => _rating4;
  String? get rating3 => _rating3;
  String? get rating2 => _rating2;
  String? get rating1 => _rating1;
  String? get rating0 => _rating0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rating_5'] = _rating5;
    map['rating_4'] = _rating4;
    map['rating_3'] = _rating3;
    map['rating_2'] = _rating2;
    map['rating_1'] = _rating1;
    map['rating_0'] = _rating0;
    return map;
  }

}

/// name : "bala"
/// profilePhoto : "image_picker_539ED045-E87E-469D-AAF2-2E353D6FB6A9-11691-000000217E604072.jpg"
/// id : 7
/// ratings : "5.0"
/// productId : 4
/// image : "ecommerce-platform-data-1.webp"
/// comments : "Very Good Product"
/// createdOn : "2024-02-01T07:17:41.000Z"
/// createdBy : 10007
/// updatedOn : "2024-02-01T07:17:41.000Z"
/// updatedBy : null
/// deleteFlag : 0

class Data {
  Data({
      String? name, 
      String? profilePhoto, 
      num? id, 
      String? ratings, 
      num? productId, 
      String? image, 
      String? comments, 
      String? createdOn, 
      num? createdBy, 
      String? updatedOn, 
      dynamic updatedBy, 
      num? deleteFlag,}){
    _name = name;
    _profilePhoto = profilePhoto;
    _id = id;
    _ratings = ratings;
    _productId = productId;
    _image = image;
    _comments = comments;
    _createdOn = createdOn;
    _createdBy = createdBy;
    _updatedOn = updatedOn;
    _updatedBy = updatedBy;
    _deleteFlag = deleteFlag;
}

  Data.fromJson(dynamic json) {
    _name = json['name'];
    _profilePhoto = json['profilePhoto'];
    _id = json['id'];
    _ratings = json['ratings'];
    _productId = json['productId'];
    _image = json['image'];
    _comments = json['comments'];
    _createdOn = json['createdOn'];
    _createdBy = json['createdBy'];
    _updatedOn = json['updatedOn'];
    _updatedBy = json['updatedBy'];
    _deleteFlag = json['deleteFlag'];
  }
  String? _name;
  String? _profilePhoto;
  num? _id;
  String? _ratings;
  num? _productId;
  String? _image;
  String? _comments;
  String? _createdOn;
  num? _createdBy;
  String? _updatedOn;
  dynamic _updatedBy;
  num? _deleteFlag;
Data copyWith({  String? name,
  String? profilePhoto,
  num? id,
  String? ratings,
  num? productId,
  String? image,
  String? comments,
  String? createdOn,
  num? createdBy,
  String? updatedOn,
  dynamic updatedBy,
  num? deleteFlag,
}) => Data(  name: name ?? _name,
  profilePhoto: profilePhoto ?? _profilePhoto,
  id: id ?? _id,
  ratings: ratings ?? _ratings,
  productId: productId ?? _productId,
  image: image ?? _image,
  comments: comments ?? _comments,
  createdOn: createdOn ?? _createdOn,
  createdBy: createdBy ?? _createdBy,
  updatedOn: updatedOn ?? _updatedOn,
  updatedBy: updatedBy ?? _updatedBy,
  deleteFlag: deleteFlag ?? _deleteFlag,
);
  String? get name => _name;
  String? get profilePhoto => _profilePhoto;
  num? get id => _id;
  String? get ratings => _ratings;
  num? get productId => _productId;
  String? get image => _image;
  String? get comments => _comments;
  String? get createdOn => _createdOn;
  num? get createdBy => _createdBy;
  String? get updatedOn => _updatedOn;
  dynamic get updatedBy => _updatedBy;
  num? get deleteFlag => _deleteFlag;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['profilePhoto'] = _profilePhoto;
    map['id'] = _id;
    map['ratings'] = _ratings;
    map['productId'] = _productId;
    map['image'] = _image;
    map['comments'] = _comments;
    map['createdOn'] = _createdOn;
    map['createdBy'] = _createdBy;
    map['updatedOn'] = _updatedOn;
    map['updatedBy'] = _updatedBy;
    map['deleteFlag'] = _deleteFlag;
    return map;
  }

}