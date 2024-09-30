part of 'meals_bloc.dart';

@immutable
sealed class MealsEvent {}
class Getitem extends MealsEvent{

}
class ToggleFavorite extends MealsEvent {
  final String mealId;

  ToggleFavorite({required this.mealId});
}
class NotConnect extends MealsEvent{

}
