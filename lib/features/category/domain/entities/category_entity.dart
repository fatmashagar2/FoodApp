class CategoryEntity {
  final String id;
  final String name;
  final String thumbnailUrl;
  final String description;

  CategoryEntity({
    required this.id,
    required this.name,
    required this.thumbnailUrl,
    required this.description,
  });

  factory CategoryEntity.fromJson(Map<String, dynamic> json) {
    return CategoryEntity(
      id: json['idCategory'],
      name: json['strCategory'],
      thumbnailUrl: json['strCategoryThumb'],
      description: json['strCategoryDescription'],
    );
  }
}