import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/custom_widget/custom_text_widget.dart';
import 'cubit/home_cubit.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(context),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = context.read<HomeCubit>();
          if (state is HomeProduct) {
            return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: Color(0xff0456F0),
                  title: CustomText(
                    text: 'Company Name',
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  leading: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                  ),
                ),
                body: FutureBuilder(
                    future: cubit.apiProductList(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return GridView.builder(
                          itemCount: state.apiProductResponse.data.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 4.0,
                                  mainAxisSpacing: 4.0),
                          itemBuilder: (context, index) {
                            var data = state.apiProductResponse.data[index];
                            return Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.network(
                                   data.productFile,
                                    width: 150,
                                  ),
                                  Text(data.title)
                                ],
                              ),
                            );
                          },
                        );
                      }
                    }));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
