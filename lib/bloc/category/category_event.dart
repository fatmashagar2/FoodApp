part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {}
class GetCategory extends CategoryEvent{

}

class NotConnect extends CategoryEvent{

}
