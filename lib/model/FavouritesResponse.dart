/// status : true
/// message : "Success"
/// data : [4,8]

class FavouritesResponse {
  FavouritesResponse({
      bool? status, 
      String? message, 
      List<num>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  FavouritesResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? json['data'].cast<num>() : [];
  }
  bool? _status;
  String? _message;
  List<num>? _data;
FavouritesResponse copyWith({  bool? status,
  String? message,
  List<num>? data,
}) => FavouritesResponse(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  List<num>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['data'] = _data;
    return map;
  }

}