class CategoryModel {
  final String id;
  final String name;
  final String thumbnailUrl;
  final String description;

  CategoryModel({
    required this.id,
    required this.name,
    required this.thumbnailUrl,
    required this.description,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['idCategory'],
      name: json['strCategory'],
      thumbnailUrl: json['strCategoryThumb'],
      description: json['strCategoryDescription'],
    );
  }
}