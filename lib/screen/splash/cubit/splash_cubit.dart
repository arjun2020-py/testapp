import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../home/screen_home.dart';
import '../../login/screen_login.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this.context) : super(SplashInitial()) {
    splash();
  }
  BuildContext context;

  splash() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.get('access_token');
    Future.delayed(Duration(milliseconds: 500), () {
      if (token == null) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ScreenLogin(),
        ));
      } else {
         Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ScreenHome(),
        ));
      }

      emit(SplashInitial());
    });
  }
}
