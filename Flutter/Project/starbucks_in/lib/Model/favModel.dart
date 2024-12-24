class FavModel {
  //String productId;
  String productName;
  String productPrice;
  String productImage;
  FavModel(
      {//required this.productId,
      required this.productName,
      required this.productPrice,
      required this.productImage});

// Convert Product to a Map for Firebase storage
  Map<String, dynamic> toMap() {
    return {

      'productName': productName,
      'productImage': productImage,
      'productPrice': productPrice,
    };
  }

  // Convert Map to Product
  factory FavModel.fromMap(Map<String, dynamic> map) {
    return FavModel(
      productName: map['productName'],
      productImage: map['productImage'],
      productPrice: map['productPrice'],
    );
  }
}