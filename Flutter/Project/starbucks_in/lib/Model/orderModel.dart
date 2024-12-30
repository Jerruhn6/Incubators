class Ordermodel {
  //String productId;
  String productName;
  String productPrice;
  String productImage;
  bool isConfirmed;
  String? status ;

  Ordermodel(
      {//required this.productId,
      required this.productName,
      required this.productPrice,
      required this.productImage,required this.isConfirmed,this.status="Pendding"});

// Convert Product to a Map for Firebase storage
  Map<String, dynamic> toMap() {
    return {

      'productName': productName,
      'productImage': productImage,
      'productPrice': productPrice,
      'isConfirmed':isConfirmed,
     'status':status
    };
  }

  // Convert Map to Product
  factory Ordermodel.fromMap(Map<String, dynamic> map) {
    return Ordermodel(
      productName: map['productName'],
      productImage: map['productImage'],
      productPrice: map['productPrice'],
      isConfirmed: map['isConfirm'],
      status: map['status']
    );
  }
}