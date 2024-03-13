import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../home/screen_home.dart';
import '../model/api_login_response.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.context) : super(LoginInitial());
  BuildContext context;
  ApiLoginRespose? apiLoginRespose;
  TextEditingController usernameController = TextEditingController(),
      passwrodController = TextEditingController();
  Future<void> loginApi(String username, String passwrod) async {
    final String url = 'https://lendit.chkdemo.com/api/login';

    final response = await http.post(Uri.parse(url),
        body: {"user_name": username, "password": passwrod});
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      apiLoginRespose = ApiLoginRespose.fromJson(responseData);
      var token = apiLoginRespose!.accessToken;
      print('token is ====== ${token}=====');
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      sharedPreferences.setString('access_token', token);

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ScreenHome(),
      ));
    }
  }
}
