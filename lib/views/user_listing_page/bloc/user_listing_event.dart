part of 'user_listing_bloc.dart';

abstract class UserListingEvent extends Equatable {
  const UserListingEvent();

  @override
  List<Object> get props => [];
}

class LoadUsers extends UserListingEvent {}
