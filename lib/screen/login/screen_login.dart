import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/custom_color/custom_color.dart';
import '../../utils/custom_widget/custom_sized_box.dart';
import '../../utils/custom_widget/custom_text_widget.dart';
import '../../utils/custom_widget/custom_textfiled.dart';
import 'cubit/login_cubit.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(context),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          var cubit = context.read<LoginCubit>();
          return Scaffold(
            appBar: AppBar(
              leading: Container(
                decoration:
                    BoxDecoration(color: arrowColor, shape: BoxShape.circle),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_rounded,
                    )),
              ),
            ),
            body: ListView(
              children: [
                Center(
                  child: Column(
                    //  mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                          text: 'Login to your account',
                          fontSize: 20,
                          color: appTextFirstCoor,
                          fontWeight: FontWeight.bold),
                      verticalSizedBox(50),
                      CustomTextFiled(
                        controller: cubit.usernameController,
                        hintText: 'username',
                      ),
                      CustomTextFiled(
                        hintText: 'Passwrod',
                        controller: cubit.passwrodController,
                      ),
                      verticalSizedBox(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                              text: 'Forgot your passwrod and usermame ?',
                              fontSize: 15,
                              color: appTextSecondColor,
                              fontWeight: FontWeight.w200),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Click here',
                                style: TextStyle(color: blackColor),
                              ))
                        ],
                      ),
                      verticalSizedBox(20),
                      Row(
                        children: [
                          Expanded(child: Divider()),
                          horoztalSizedBox(10),
                          Text('or'),
                          horoztalSizedBox(10),
                          Expanded(child: Divider())
                        ],
                      ),
                      verticalSizedBox(60),
                      CustomText(
                          text: 'Continue with',
                          fontSize: 16,
                          color: appTextSecondColor,
                          fontWeight: FontWeight.w300),
                      verticalSizedBox(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  AssetImage('assets/images/google.png'),
                            ),
                          ),
                          horoztalSizedBox(20),
                          InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  AssetImage('assets/images/facebook.png'),
                            ),
                          )
                        ],
                      ),
                      verticalSizedBox(30),
                      SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          child: ElevatedButton(
                            onPressed: () {
                                print('--------------------p1');
                                var username = cubit.usernameController.text;
                                var passwrod = cubit.passwrodController.text;
                                cubit.loginApi(username, passwrod);
                            },
                            child: Text(
                              'Submit',
                              style: TextStyle(color: blackColor),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: buttonColor),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                              text: 'Dont have an account?',
                              fontSize: 15,
                              color: appTextSecondColor,
                              fontWeight: FontWeight.w200),
                          TextButton(
                              onPressed: () {
                              
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(color: blackColor),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
