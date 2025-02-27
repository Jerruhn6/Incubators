class FavModel {
  //String productId;
  String productDes;
  String productPrice;
  String productImage;
  FavModel(
      {//required this.productId,
      required this.productDes,
      required this.productPrice,
      required this.productImage});

// Convert Product to a Map for Firebase storage
  Map<String, dynamic> toMap() {
    return {

      'productDes': productDes,
      'productImage': productImage,
      'productPrice': productPrice,
    };
  }

  // Convert Map to Product
  factory FavModel.fromMap(Map<String, dynamic> map) {
    return FavModel(
      productDes: map['productDes'],
      productImage: map['productImage'],
      productPrice: map['productPrice'],
    );
  }
}
