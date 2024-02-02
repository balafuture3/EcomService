/// status : true
/// message : "Success"
/// profile : {"profilePhoto":"049619e8-7160-4cc7-b8c9-3202800109e18507652682420612369.jpg"}
/// shipping : {"ShippingCount":7}
/// payment : {"PaymentCount":9}
/// order : {"OrderCount":4}

class ProfileResponse {
  ProfileResponse({
      bool? status, 
      String? message, 
      Profile? profile, 
      Shipping? shipping, 
      Payment? payment, 
      Order? order,}){
    _status = status;
    _message = message;
    _profile = profile;
    _shipping = shipping;
    _payment = payment;
    _order = order;
}

  ProfileResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _profile = json['profile'] != null ? Profile.fromJson(json['profile']) : null;
    _shipping = json['shipping'] != null ? Shipping.fromJson(json['shipping']) : null;
    _payment = json['payment'] != null ? Payment.fromJson(json['payment']) : null;
    _order = json['order'] != null ? Order.fromJson(json['order']) : null;
  }
  bool? _status;
  String? _message;
  Profile? _profile;
  Shipping? _shipping;
  Payment? _payment;
  Order? _order;
ProfileResponse copyWith({  bool? status,
  String? message,
  Profile? profile,
  Shipping? shipping,
  Payment? payment,
  Order? order,
}) => ProfileResponse(  status: status ?? _status,
  message: message ?? _message,
  profile: profile ?? _profile,
  shipping: shipping ?? _shipping,
  payment: payment ?? _payment,
  order: order ?? _order,
);
  bool? get status => _status;
  String? get message => _message;
  Profile? get profile => _profile;
  Shipping? get shipping => _shipping;
  Payment? get payment => _payment;
  Order? get order => _order;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_profile != null) {
      map['profile'] = _profile?.toJson();
    }
    if (_shipping != null) {
      map['shipping'] = _shipping?.toJson();
    }
    if (_payment != null) {
      map['payment'] = _payment?.toJson();
    }
    if (_order != null) {
      map['order'] = _order?.toJson();
    }
    return map;
  }

}

/// OrderCount : 4

class Order {
  Order({
      num? orderCount,}){
    _orderCount = orderCount;
}

  Order.fromJson(dynamic json) {
    _orderCount = json['OrderCount'];
  }
  num? _orderCount;
Order copyWith({  num? orderCount,
}) => Order(  orderCount: orderCount ?? _orderCount,
);
  num? get orderCount => _orderCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['OrderCount'] = _orderCount;
    return map;
  }

}

/// PaymentCount : 9

class Payment {
  Payment({
      num? paymentCount,}){
    _paymentCount = paymentCount;
}

  Payment.fromJson(dynamic json) {
    _paymentCount = json['PaymentCount'];
  }
  num? _paymentCount;
Payment copyWith({  num? paymentCount,
}) => Payment(  paymentCount: paymentCount ?? _paymentCount,
);
  num? get paymentCount => _paymentCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['PaymentCount'] = _paymentCount;
    return map;
  }

}

/// ShippingCount : 7

class Shipping {
  Shipping({
      num? shippingCount,}){
    _shippingCount = shippingCount;
}

  Shipping.fromJson(dynamic json) {
    _shippingCount = json['ShippingCount'];
  }
  num? _shippingCount;
Shipping copyWith({  num? shippingCount,
}) => Shipping(  shippingCount: shippingCount ?? _shippingCount,
);
  num? get shippingCount => _shippingCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ShippingCount'] = _shippingCount;
    return map;
  }

}

/// profilePhoto : "049619e8-7160-4cc7-b8c9-3202800109e18507652682420612369.jpg"

class Profile {
  Profile({
      String? profilePhoto,}){
    _profilePhoto = profilePhoto;
}

  Profile.fromJson(dynamic json) {
    _profilePhoto = json['profilePhoto'];
  }
  String? _profilePhoto;
Profile copyWith({  String? profilePhoto,
}) => Profile(  profilePhoto: profilePhoto ?? _profilePhoto,
);
  String? get profilePhoto => _profilePhoto;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['profilePhoto'] = _profilePhoto;
    return map;
  }

}