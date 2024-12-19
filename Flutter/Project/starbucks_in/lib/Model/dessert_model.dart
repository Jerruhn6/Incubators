class DessertModel {
  final String name;
  final String price;
  final String image_Path;
  bool isFavorite;

  DessertModel(
      {required this.name, required this.price, required this.image_Path, this.isFavorite = false,});
}
