import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/cubit/user_cubit.dart';
import 'package:myapp/network/network_call.dart';
import 'package:myapp/user_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Users Demo',
      home: BlocProvider<UserCubit>(
        create: (context) => UserCubit(RestClient)..getAllUsers(),
        child: const UserList(),
        ),
      );
  }
}