import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_bloc/views/manage_user_page/views/manage_user_page.dart';
import 'package:testing_bloc/views/user_listing_page/bloc/user_listing_bloc.dart';

class UserListingPage extends StatefulWidget {
  const UserListingPage({Key? key}) : super(key: key);

  @override
  State<UserListingPage> createState() => _UserListingPageState();
}

class _UserListingPageState extends State<UserListingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _loadData() {
    context.read<UserListingBloc>().add(
          LoadUsers(),
        );
  }

  Size get mediaQ {
    return MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Users",
        ),
      ),
      body: BlocBuilder<UserListingBloc, UserListingModel>(
        builder: (context, state) {
          if (state.userListingState is UserListingLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.userListingState is UserListingLoaded) {
            return ListView(
              children: state.userList.map(
                (e) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return ManageUserPage(
                            id: e.id,
                          );
                        }),
                      );
                    },
                    title: Text(
                      e.firstName + e.lastName,
                    ),
                  );
                },
              ).toList(),
            );
          } else if (state.userListingState is UserListingError) {
            return SizedBox(
              width: mediaQ.width,
              height: mediaQ.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    (state.userListingState as UserListingError).msg,
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
          }
          return SizedBox(
            child: Center(
              child: Text(
                state.userListingState.toString(),
              ),
            ),
          );
        },
      ),
    );
  }
}
