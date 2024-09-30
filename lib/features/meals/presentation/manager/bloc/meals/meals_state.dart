part of 'meals_bloc.dart';

@immutable
sealed class MealsState {}

final class MealsLoading extends MealsState {}
final class MealsSuccess extends MealsState {
  final List<MealsModel>?mal;
  final Set<String> favoriteMealIds;  // Track favorite meals by their IDs

  MealsSuccess({required this.mal, required this.favoriteMealIds});
}
final class MealsFailure extends MealsState {
  String error;
  MealsFailure({required this.error});
}
final class  CategoryNotConnect extends MealsState {
  final String message;

  CategoryNotConnect({required this.message});
}
