part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();
  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {}

class UserLoaded extends UserState {}

class UserError extends UserState {}
