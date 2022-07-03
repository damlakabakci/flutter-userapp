import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/user_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {

  final UserRepository;

  UserCubit(this.UserRepository) : super(UserInitial()) {
    FetchData();
  }

  void FetchData() async
  {
    try {
      var response = await Dio().get("https://randomuser.me/api/");
      if(response.statusCode == 200)
      {
        var result = response.data["results"];
        emit(UserLoaded(result));
        jsonDecode(response.data.toString());
      }
    } catch (e) {}
  }
  void getAllUsers() async {
    try {
      emit(UserLoading());
      final Users = await UserRepository.getAllUsers();
      emit(UserLoaded(Users));
    } catch (e) {
      emit(const UserError('Error'));
    }
  }
}