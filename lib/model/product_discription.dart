class ProductDiscriptionModel {
  ProductDetails? productDetails;

  ProductDiscriptionModel({this.productDetails});

  ProductDiscriptionModel.fromJson(Map<String, dynamic> json) {
    productDetails = json['product_details'] != null
        ? new ProductDetails.fromJson(json['product_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productDetails != null) {
      data['product_details'] = this.productDetails!.toJson();
    }
    return data;
  }
}

class ProductDetails {
  int? rating;
  int? review;
  int? productStock;
  List<String>? images;
  Description? description;

  ProductDetails(
      {this.rating,
      this.review,
      this.productStock,
      this.images,
      this.description});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    review = json['review'];
    productStock = json['product_stock'];
    images = json['images'].cast<String>();
    description = json['description'] != null
        ? new Description.fromJson(json['description'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating'] = this.rating;
    data['review'] = this.review;
    data['product_stock'] = this.productStock;
    data['images'] = this.images;
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    return data;
  }
}

class Description {
  String? en;

  Description({this.en});

  Description.fromJson(Map<String, dynamic> json) {
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    return data;
  }
}
