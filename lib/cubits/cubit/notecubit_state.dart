part of 'notecubit_cubit.dart';

@immutable
abstract class NotecubitState {}

class NotecubitInitial extends NotecubitState {}

class AddNoteLoading extends NotecubitState {}

class AddNoteSuccess extends NotecubitState {}

class AddNoteFailure extends NotecubitState {
  final String eerMassage;

  AddNoteFailure(this.eerMassage);
}
