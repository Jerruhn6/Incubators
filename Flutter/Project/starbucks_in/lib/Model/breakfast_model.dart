class BreakfastModel {
  final String name;
  final String price;
  final String image_path;
  bool isFavorite;

  BreakfastModel(
      {required this.name, required this.price, required this.image_path, this.isFavorite = false});
}
