part of 'details_bloc.dart';

@immutable
sealed class DetailsState {}

final class DetailsLoading extends DetailsState {}
final class DetailsSuccess extends DetailsState {
    final List<DetailsOfMeal> details;

    DetailsSuccess({required this.details});

}
final class DetailsFailure extends DetailsState {
    final String error;

    DetailsFailure({required this.error});
}
final class  CategoryNotConnect extends DetailsState {
    final String message;

    CategoryNotConnect({required this.message});
}


