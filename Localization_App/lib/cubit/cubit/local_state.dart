part of 'local_cubit.dart';

@immutable
sealed class LocalState {}

final class LocalInitial extends LocalState {}

//اللغه الي هرجعها
final class changeLocalLanguage extends LocalState {
  final Locale? local;

  changeLocalLanguage({this.local});
}
