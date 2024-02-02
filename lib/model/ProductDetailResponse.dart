/// status : true
/// message : "Success"
/// data : {"ratings":"4.5","r_image":"ecommerce-platform-data-1.webp","comments":"Very Good Product","quantity":302,"productId":12,"name":"Pattu Frog","price":"2000.00","description":"To share one or multiple files, invoke the static shareXFiles method anywhere in your Dart code. The method returns a ShareResult. Optionally, you can pass subject, text and sharePositionOrigin.","image":"91fvA-kh7NL._SY879_.jpg;91J7nLKNjbL._SX679_.jpg","sizes":"S;L;M;XL;XXL;XXXL","colors":"#FF5733;#FFdcba;#51FF00","aboutItem":"Highly Elastic Fabric:Mens fitted dress shirts are made of high stretch fabric with high quality nylon, allowing the body to move more freely, comfortable, breathable and smooth to the touch.\nFeatures:Mens button down shirts are made with special craftsmanship, not easy to wrinkle and easy to take care of. High-grade fabrics can bring you a cool feeling.\nSlim And Muscular Fit:Modern muscle fit slim fit dress shirts for men have enough stretch for easy movement, classic neckline designed to fit all sizes of bow ties with or without tie, smooth body, no pockets, and wide cut for a neat look of the shirt.\nMoisture Wicking:Long sleeve mens dress shirts are designed to wick away sweat to keep you dry, breathable and comfortable even when youre exercising; the wrinkle resistant fabric is easy to care for and iron.\nOccasion:Business casual shirts for men are suitable for business, wedding, banquet, dating and other occasions, whether it is a formal occasion or daily leisure, it can bring you charm at any time. It is also the ideal gift for Thanksgiving, Fathers Day, Valentines Day, Christmas, family, lovers and friends","additionalInfo":"Manufacturer:PW PLATYPUS WORLD, PW PLATYPUS WORLD TEAM","discountId":3,"l1CategoryId":1,"l2CategoryId":1,"l3CategoryId":1,"createdBy":1234,"createdOn":"2024-01-02T06:42:25.000Z","updatedBy":1234,"updatedOn":"2024-01-03T02:43:41.000Z","deleteFlag":0,"discountName":"Year End Sales","discountDescription":"undefined","discountPercent":"14","rootCategory":"Electronics","secondaryCategory":"Mobiles","Category":"Touch Screen mobiles"}

class ProductDetailResponse {
  ProductDetailResponse({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  ProductDetailResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
ProductDetailResponse copyWith({  bool? status,
  String? message,
  Data? data,
}) => ProductDetailResponse(  status: status ?? _status,
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

/// ratings : "4.5"
/// r_image : "ecommerce-platform-data-1.webp"
/// comments : "Very Good Product"
/// quantity : 302
/// productId : 12
/// name : "Pattu Frog"
/// price : "2000.00"
/// description : "To share one or multiple files, invoke the static shareXFiles method anywhere in your Dart code. The method returns a ShareResult. Optionally, you can pass subject, text and sharePositionOrigin."
/// image : "91fvA-kh7NL._SY879_.jpg;91J7nLKNjbL._SX679_.jpg"
/// sizes : "S;L;M;XL;XXL;XXXL"
/// colors : "#FF5733;#FFdcba;#51FF00"
/// aboutItem : "Highly Elastic Fabric:Mens fitted dress shirts are made of high stretch fabric with high quality nylon, allowing the body to move more freely, comfortable, breathable and smooth to the touch.\nFeatures:Mens button down shirts are made with special craftsmanship, not easy to wrinkle and easy to take care of. High-grade fabrics can bring you a cool feeling.\nSlim And Muscular Fit:Modern muscle fit slim fit dress shirts for men have enough stretch for easy movement, classic neckline designed to fit all sizes of bow ties with or without tie, smooth body, no pockets, and wide cut for a neat look of the shirt.\nMoisture Wicking:Long sleeve mens dress shirts are designed to wick away sweat to keep you dry, breathable and comfortable even when youre exercising; the wrinkle resistant fabric is easy to care for and iron.\nOccasion:Business casual shirts for men are suitable for business, wedding, banquet, dating and other occasions, whether it is a formal occasion or daily leisure, it can bring you charm at any time. It is also the ideal gift for Thanksgiving, Fathers Day, Valentines Day, Christmas, family, lovers and friends"
/// additionalInfo : "Manufacturer:PW PLATYPUS WORLD, PW PLATYPUS WORLD TEAM"
/// discountId : 3
/// l1CategoryId : 1
/// l2CategoryId : 1
/// l3CategoryId : 1
/// createdBy : 1234
/// createdOn : "2024-01-02T06:42:25.000Z"
/// updatedBy : 1234
/// updatedOn : "2024-01-03T02:43:41.000Z"
/// deleteFlag : 0
/// discountName : "Year End Sales"
/// discountDescription : "undefined"
/// discountPercent : "14"
/// rootCategory : "Electronics"
/// secondaryCategory : "Mobiles"
/// Category : "Touch Screen mobiles"

class Data {
  Data({
      String? ratings, 
      String? rImage, 
      String? comments, 
      num? quantity, 
      num? productId, 
      String? name, 
      String? price, 
      String? description, 
      String? image, 
      String? sizes, 
      String? colors, 
      String? aboutItem, 
      String? additionalInfo, 
      num? discountId, 
      num? l1CategoryId, 
      num? l2CategoryId, 
      num? l3CategoryId, 
      num? createdBy, 
      String? createdOn, 
      num? updatedBy, 
      String? updatedOn, 
      num? deleteFlag, 
      String? discountName, 
      String? discountDescription, 
      String? discountPercent, 
      String? rootCategory, 
      String? secondaryCategory, 
      String? category,}){
    _ratings = ratings;
    _rImage = rImage;
    _comments = comments;
    _quantity = quantity;
    _productId = productId;
    _name = name;
    _price = price;
    _description = description;
    _image = image;
    _sizes = sizes;
    _colors = colors;
    _aboutItem = aboutItem;
    _additionalInfo = additionalInfo;
    _discountId = discountId;
    _l1CategoryId = l1CategoryId;
    _l2CategoryId = l2CategoryId;
    _l3CategoryId = l3CategoryId;
    _createdBy = createdBy;
    _createdOn = createdOn;
    _updatedBy = updatedBy;
    _updatedOn = updatedOn;
    _deleteFlag = deleteFlag;
    _discountName = discountName;
    _discountDescription = discountDescription;
    _discountPercent = discountPercent;
    _rootCategory = rootCategory;
    _secondaryCategory = secondaryCategory;
    _category = category;
}

  Data.fromJson(dynamic json) {
    _ratings = json['ratings'];
    _rImage = json['r_image'];
    _comments = json['comments'];
    _quantity = json['quantity'];
    _productId = json['productId'];
    _name = json['name'];
    _price = json['price'];
    _description = json['description'];
    _image = json['image'];
    _sizes = json['sizes'];
    _colors = json['colors'];
    _aboutItem = json['aboutItem'];
    _additionalInfo = json['additionalInfo'];
    _discountId = json['discountId'];
    _l1CategoryId = json['l1CategoryId'];
    _l2CategoryId = json['l2CategoryId'];
    _l3CategoryId = json['l3CategoryId'];
    _createdBy = json['createdBy'];
    _createdOn = json['createdOn'];
    _updatedBy = json['updatedBy'];
    _updatedOn = json['updatedOn'];
    _deleteFlag = json['deleteFlag'];
    _discountName = json['discountName'];
    _discountDescription = json['discountDescription'];
    _discountPercent = json['discountPercent'];
    _rootCategory = json['rootCategory'];
    _secondaryCategory = json['secondaryCategory'];
    _category = json['Category'];
  }
  String? _ratings;
  String? _rImage;
  String? _comments;
  num? _quantity;
  num? _productId;
  String? _name;
  String? _price;
  String? _description;
  String? _image;
  String? _sizes;
  String? _colors;
  String? _aboutItem;
  String? _additionalInfo;
  num? _discountId;
  num? _l1CategoryId;
  num? _l2CategoryId;
  num? _l3CategoryId;
  num? _createdBy;
  String? _createdOn;
  num? _updatedBy;
  String? _updatedOn;
  num? _deleteFlag;
  String? _discountName;
  String? _discountDescription;
  String? _discountPercent;
  String? _rootCategory;
  String? _secondaryCategory;
  String? _category;
Data copyWith({  String? ratings,
  String? rImage,
  String? comments,
  num? quantity,
  num? productId,
  String? name,
  String? price,
  String? description,
  String? image,
  String? sizes,
  String? colors,
  String? aboutItem,
  String? additionalInfo,
  num? discountId,
  num? l1CategoryId,
  num? l2CategoryId,
  num? l3CategoryId,
  num? createdBy,
  String? createdOn,
  num? updatedBy,
  String? updatedOn,
  num? deleteFlag,
  String? discountName,
  String? discountDescription,
  String? discountPercent,
  String? rootCategory,
  String? secondaryCategory,
  String? category,
}) => Data(  ratings: ratings ?? _ratings,
  rImage: rImage ?? _rImage,
  comments: comments ?? _comments,
  quantity: quantity ?? _quantity,
  productId: productId ?? _productId,
  name: name ?? _name,
  price: price ?? _price,
  description: description ?? _description,
  image: image ?? _image,
  sizes: sizes ?? _sizes,
  colors: colors ?? _colors,
  aboutItem: aboutItem ?? _aboutItem,
  additionalInfo: additionalInfo ?? _additionalInfo,
  discountId: discountId ?? _discountId,
  l1CategoryId: l1CategoryId ?? _l1CategoryId,
  l2CategoryId: l2CategoryId ?? _l2CategoryId,
  l3CategoryId: l3CategoryId ?? _l3CategoryId,
  createdBy: createdBy ?? _createdBy,
  createdOn: createdOn ?? _createdOn,
  updatedBy: updatedBy ?? _updatedBy,
  updatedOn: updatedOn ?? _updatedOn,
  deleteFlag: deleteFlag ?? _deleteFlag,
  discountName: discountName ?? _discountName,
  discountDescription: discountDescription ?? _discountDescription,
  discountPercent: discountPercent ?? _discountPercent,
  rootCategory: rootCategory ?? _rootCategory,
  secondaryCategory: secondaryCategory ?? _secondaryCategory,
  category: category ?? _category,
);
  String? get ratings => _ratings;
  String? get rImage => _rImage;
  String? get comments => _comments;
  num? get quantity => _quantity;
  num? get productId => _productId;
  String? get name => _name;
  String? get price => _price;
  String? get description => _description;
  String? get image => _image;
  String? get sizes => _sizes;
  String? get colors => _colors;
  String? get aboutItem => _aboutItem;
  String? get additionalInfo => _additionalInfo;
  num? get discountId => _discountId;
  num? get l1CategoryId => _l1CategoryId;
  num? get l2CategoryId => _l2CategoryId;
  num? get l3CategoryId => _l3CategoryId;
  num? get createdBy => _createdBy;
  String? get createdOn => _createdOn;
  num? get updatedBy => _updatedBy;
  String? get updatedOn => _updatedOn;
  num? get deleteFlag => _deleteFlag;
  String? get discountName => _discountName;
  String? get discountDescription => _discountDescription;
  String? get discountPercent => _discountPercent;
  String? get rootCategory => _rootCategory;
  String? get secondaryCategory => _secondaryCategory;
  String? get category => _category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ratings'] = _ratings;
    map['r_image'] = _rImage;
    map['comments'] = _comments;
    map['quantity'] = _quantity;
    map['productId'] = _productId;
    map['name'] = _name;
    map['price'] = _price;
    map['description'] = _description;
    map['image'] = _image;
    map['sizes'] = _sizes;
    map['colors'] = _colors;
    map['aboutItem'] = _aboutItem;
    map['additionalInfo'] = _additionalInfo;
    map['discountId'] = _discountId;
    map['l1CategoryId'] = _l1CategoryId;
    map['l2CategoryId'] = _l2CategoryId;
    map['l3CategoryId'] = _l3CategoryId;
    map['createdBy'] = _createdBy;
    map['createdOn'] = _createdOn;
    map['updatedBy'] = _updatedBy;
    map['updatedOn'] = _updatedOn;
    map['deleteFlag'] = _deleteFlag;
    map['discountName'] = _discountName;
    map['discountDescription'] = _discountDescription;
    map['discountPercent'] = _discountPercent;
    map['rootCategory'] = _rootCategory;
    map['secondaryCategory'] = _secondaryCategory;
    map['Category'] = _category;
    return map;
  }

}