import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_bloc/views/manage_user_page/bloc/manage_user_bloc.dart';

class ManageUserPage extends StatefulWidget {
  final int id;
  const ManageUserPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<ManageUserPage> createState() => _ManageUserPageState();
}

class _ManageUserPageState extends State<ManageUserPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _loadData() {
    context.read<ManageUserBloc>().add(
          LoadSingleUser(),
        );
  }

  Size get mediaQ {
    return MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ManageUserBloc>(
      create: (context) => ManageUserBloc(
        id: widget.id,
      )..add(
          LoadSingleUser(),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Manage user"),
        ),
        body: BlocBuilder<ManageUserBloc, ManageUserModel>(
          builder: (context, state) {
            if (state.manageUserState is ManageUserLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.manageUserState is ManageUserLoaded) {
              return Container(
                child: ListView(
                  children: [
                    Text(
                      "${(state.manageUserState as ManageUserLoaded).user.toJson()}",
                    )
                  ],
                ),
              );
            } else if (state.manageUserState is ManageUserError) {
              return Builder(builder: (context) {
                return SizedBox(
                  width: mediaQ.width,
                  height: mediaQ.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        (state.manageUserState as ManageUserError).msg,
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: _loadData,
                        child: const Text(
                          "Retry",
                        ),
                      ),
                    ],
                  ),
                );
              });
            }
            return Container();
          },
        ),
      ),
    );
  }
}
