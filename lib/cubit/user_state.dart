part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoaded extends UserState {
  final List<User> Users;
  const UserLoaded(this.Users);

  @override
  List<Object> get props => [Users];
}

class UserError extends UserState {
  final String message;
  const UserError(this.message);

  @override
  List<Object> get props => [message];
}