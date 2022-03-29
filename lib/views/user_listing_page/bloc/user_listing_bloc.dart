import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testing_bloc/models/user_model.dart';
import 'package:testing_bloc/repositories/user_repository.dart';

part 'user_listing_event.dart';
part 'user_listing_state.dart';

class UserListingBloc extends Bloc<UserListingEvent, UserListingModel> {
  UserListingBloc()
      : super(
          UserListingModel.initial(),
        ) {
    on<LoadUsers>(_onLoadUsers);
  }

  final UserRepoInterface userRepoInterface = UserRepoInterface();

  _onLoadUsers(LoadUsers event, Emitter emit) async {
    try {
      emit(state.copyWith(
        newUserListingState: UserListingLoading(),
      ));
      // throw("sks");
      List<User> userList = await userRepoInterface.getListUser();
      emit(
        state.copyWith(
          newUserList: userList,
          newUserListingState: UserListingLoaded(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          newUserListingState: UserListingError(
            msg: 'Load user failed',
          ),
        ),
      );
    }
  }
}
