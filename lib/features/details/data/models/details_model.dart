class DetailsModel {
  final String? idMeal;
  final String? strMeal;
  final String? strDrinkAlternate;
  final String? strCategory;
  final String? strArea;
  final String? strInstructions;
  final String? strMealThumb;
  final String? strTags;
  final String? strYoutube;
  final List<String> ingredients;
  final List<String> measures;

  DetailsModel({
    required this.idMeal,
    required this.strMeal,
    required this.strDrinkAlternate,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
    required this.strTags,
    required this.strYoutube,
    required this.ingredients,
    required this.measures,
  });

  factory DetailsModel.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];
    List<String> measures = [];

    for (int i = 1; i <= 20; i++) {
      String ingredient = json['strIngredient$i'] ?? '';
      String measure = json['strMeasure$i'] ?? '';
      if (ingredient.isNotEmpty) ingredients.add(ingredient);
      if (measure.isNotEmpty) measures.add(measure);
    }

    return DetailsModel(
      idMeal: json['idMeal'],
      strMeal: json['strMeal'],
      strDrinkAlternate: json['strDrinkAlternate'],
      strCategory: json['strCategory'],
      strArea: json['strArea'],
      strInstructions: json['strInstructions'],
      strMealThumb: json['strMealThumb'],
      strTags: json['strTags'],
      strYoutube: json['strYoutube'],
      ingredients: ingredients,
      measures: measures,
    );

  }
  Map<String,dynamic>toJson(){
    return{
      'idMeal':idMeal,
      'strMeal':strMeal,
      'strDrinkAlternate':strDrinkAlternate,
      'strCategory':strCategory,
      'strArea':strArea,
      'strInstructions':strInstructions,
      'strMealThumb':strMealThumb,
      'strTags':strTags,
      'strYoutube':strYoutube,
      'ingredients':ingredients,
      'measures':measures
    };
  }
}
