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
Map<String,dynamic>toJson(){
    return {
      'strMeal':strMeal,
      'strMealThumb':strMealThumb,
      'idMeal':idMeal
    };
}
  MealsModel({required this.strMeal, required this.strMealThumb, required this.idMeal});
}