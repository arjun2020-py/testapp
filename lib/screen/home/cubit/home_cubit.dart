import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../model/api_product_response.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.context) : super(HomeInitial()) {
    apiProductList();
  }
  BuildContext context;
  late ApiProductResponse apiProductResponse;
  Future<List<ApiProductResponse>?> apiProductList() async {
    String url = 'https://lendit.chkdemo.com/api/product/products';

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.get('access_token');
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Authorization": "Bearer $token"},
      );

      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        List<ApiProductResponse> productList = [];
        apiProductResponse = ApiProductResponse.fromJson(responseData);
        emit(HomeProduct(apiProductResponse: apiProductResponse));
        productList.add(apiProductResponse);

        // List<ApiProductResponse> productList = [];
        // for (var singleItem in responseData) {
        //   ApiProductResponse apiProductResponse = ApiProductResponse(
        //       accessToken: singleItem['accessToken'],
        //       data: singleItem['data'],
        //       message: singleItem['message'],
        //       status: singleItem['status'],
        //       tokenType: singleItem['tokenType']);

        //   productList.add(apiProductResponse);

        //   return productList;
        // }
        return productList;
      }
    } catch (e) {
      print('expection is ${e}');
    }
  }
}
