part of 'manage_user_bloc.dart';

class ManageUserModel extends Equatable {
  final int id;
  final ManageUserState manageUserState;

  const ManageUserModel({
    required this.id,
    required this.manageUserState,
  });

  @override
  List<Object> get props => [
        id,
        manageUserState,
      ];

  factory ManageUserModel.initial({
    required int id,
  }) {
    return ManageUserModel(
      id: id,
      manageUserState: ManageUserLoading(),
    );
  }

  ManageUserModel copyWith({
    required ManageUserState newManageUserState,
  }) {
    return ManageUserModel(
      id: id,
      manageUserState: newManageUserState,
    );
  }
}

abstract class ManageUserState extends Equatable {
  const ManageUserState();

  @override
  List<Object> get props => [];
}

class ManageUserLoading extends ManageUserState {}

class ManageUserLoaded extends ManageUserState {
  final User user;
  const ManageUserLoaded({
    required this.user,
  });

  @override
  List<Object> get props => [user];
}

class ManageUserError extends ManageUserState {
  final String msg;
  const ManageUserError({
    required this.msg,
  });

  @override
  List<Object> get props => [
        msg,
      ];
}


/*
loading
loaded
error
 */