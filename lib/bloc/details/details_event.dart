part of 'details_bloc.dart';

@immutable
sealed class DetailsEvent {}
class GetDetails extends DetailsEvent{}
class NotConnect extends DetailsEvent{

}

