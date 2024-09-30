part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}


final class CategoryLoading extends CategoryState {}
final class CategorySuccess extends CategoryState {
  final List<CategoryModel>cat;

  CategorySuccess({required this.cat});
}
final class  CategoryNotConnect extends CategoryState {
  final String message;

  CategoryNotConnect({required this.message});
}
final class CategoryFailure extends CategoryState {
 final String error;

  CategoryFailure({required this.error});
}
