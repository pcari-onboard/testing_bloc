part of 'user_listing_bloc.dart';

class UserListingModel extends Equatable {
  final List<User> userList;
  final UserListingState userListingState;

  const UserListingModel({
    required this.userList,
    required this.userListingState,
  });

  @override
  List<Object> get props => [
        userList,
        userListingState,
      ];

  factory UserListingModel.initial() {
    return UserListingModel(
      userList: const [],
      userListingState: UserListingLoading(),
    );
  }

  UserListingModel copyWith({
    List<User>? newUserList,
    UserListingState? newUserListingState,
  }) {
    return UserListingModel(
      userList: newUserList ?? userList,
      userListingState: newUserListingState ?? userListingState,
    );
  }
}

abstract class UserListingState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserListingLoading extends UserListingState {}

class UserListingLoaded extends UserListingState {}

class UserListingError extends UserListingState {
  final String msg;
  UserListingError({
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
