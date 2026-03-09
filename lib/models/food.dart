class Food {
  final String name;
  final String price;
  final String imagePath;
  final String description;

  Food({
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
  });

  String get imageURL => '2.png';
}
