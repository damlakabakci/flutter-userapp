import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/cubit/user_cubit.dart';
import 'package:myapp/network/network_call.dart';
import 'package:myapp/user_detail.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          color: const Color(0xFFF6F6F6),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 32.0, bottom: 32.0),
                  ),
                  Expanded(
                    child: BlocBuilder<UserCubit, UserState>(
                        builder: (context, state) {
                      if (state is UserLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is UserError) {
                        return const Center(
                          child: Text("Connection could not be established.")
                        );
                      } else if (state is UserLoaded) {
                        final Users = state.Users;
                        return ListView.builder(
                          itemCount: Users.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return BlocProvider<UserCubit>(
                                    create: (context) => UserCubit(RestClient),
                                    child: UserDetail(user: Users[index]),
                                  );
                                }));
                              },
                            );
                          },
                        );
                      } else {
                        return const Text('Loading Users error');
                      }
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}