import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testing_bloc/models/user_model.dart';
import 'package:testing_bloc/repositories/user_repository.dart';

part 'manage_user_event.dart';
part 'manage_user_state.dart';

class ManageUserBloc extends Bloc<ManageUserEvent, ManageUserModel> {
  ManageUserBloc({
    required int id,
  }) : super(
          ManageUserModel.initial(
            id: id,
          ),
        ) {
    on<LoadSingleUser>(_onLoadSingleUser);
  }

  final UserRepoInterface userRepoInterface = UserRepoInterface();

  _onLoadSingleUser(LoadSingleUser event, Emitter emit) async {
    try {
      emit(
        state.copyWith(
          newManageUserState: ManageUserLoading(),
        ),
      );
      User user = await userRepoInterface.getSingleUser(
        id: state.id,
      );
      emit(
        state.copyWith(
          newManageUserState: ManageUserLoaded(
            user: user,
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          newManageUserState: const ManageUserError(
            msg: 'Load user failed',
          ),
        ),
      );
    }
  }
}
