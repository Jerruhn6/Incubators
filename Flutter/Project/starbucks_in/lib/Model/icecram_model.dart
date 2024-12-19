class IcecreamModel {
  final String name;
  final String price;
  final String image_path;
  bool isFavorite;

  IcecreamModel(
      {required this.name, required this.price, required this.image_path, this.isFavorite = false});
}
