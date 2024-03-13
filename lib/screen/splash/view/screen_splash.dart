import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/utils/custom_color/custom_color.dart';

import '../../../utils/custom_widget/custom_sized_box.dart';
import '../../../utils/custom_widget/custom_text_widget.dart';
import '../cubit/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(context),
      child: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          var cubit = context.read<SplashCubit>();
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png'),
                  verticalSizedBox(10),
                  CustomText(
                    text: 'Company Name',
                    color: blackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
