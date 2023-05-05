// ignore_for_file: overridden_fields, annotate_overrides, prefer_typing_uninitialized_variables

part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final User? user;

  const UserState({
    this.user,
  });
}

class UserInitial extends UserState {}

class SetUserState extends UserState {
  final User user;

  const SetUserState({required this.user}) : super(user: user);
}

class LoadingUserState extends UserState {}

class SuccessUserState extends UserState {}

class FailureUserState extends UserState {
  final error;

  const FailureUserState(this.error);
}
