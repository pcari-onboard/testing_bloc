// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class User extends Equatable {
  static const ID = 'id';
  static const EMAIL = 'email';
  static const FIRST_NAME = 'first_name';
  static const LAST_NAME = 'last_name';
  static const AVATAR = 'avatar';

  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  const User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        firstName,
        lastName,
        avatar,
      ];

  factory User.fromJson(Map map) {
    return User(
      id: map[User.ID],
      email: map[User.EMAIL],
      firstName: map[User.FIRST_NAME],
      lastName: map[User.LAST_NAME],
      avatar: map[User.AVATAR],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      User.ID: id,
      User.EMAIL: email,
      User.FIRST_NAME: firstName,
      User.LAST_NAME: lastName,
      User.AVATAR: avatar,
    };
  }
}
