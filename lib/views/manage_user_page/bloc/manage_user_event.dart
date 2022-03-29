part of 'manage_user_bloc.dart';

abstract class ManageUserEvent extends Equatable {
  const ManageUserEvent();

  @override
  List<Object> get props => [];
}

class LoadSingleUser extends ManageUserEvent {}
