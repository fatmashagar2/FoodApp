class MealsModel {
  final String strMeal;
  final String strMealThumb;
  final String idMeal;


  factory MealsModel.fromJson(Map<String, dynamic> json) {
    return MealsModel(
      strMeal: json['strMeal'],
      strMealThumb: json['strMealThumb'],
      idMeal: json['idMeal'],

    );
  }

  MealsModel({required this.strMeal, required this.strMealThumb, required this.idMeal});
}