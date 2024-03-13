// To parse this JSON data, do
//
//     final apiProductResponse = apiProductResponseFromJson(jsonString);

import 'dart:convert';

ApiProductResponse apiProductResponseFromJson(String str) => ApiProductResponse.fromJson(json.decode(str));

String apiProductResponseToJson(ApiProductResponse data) => json.encode(data.toJson());

class ApiProductResponse {
    bool status;
    List<Datum> data;
    String message;
    String accessToken;
    String tokenType;

    ApiProductResponse({
        required this.status,
        required this.data,
        required this.message,
        required this.accessToken,
        required this.tokenType,
    });

    factory ApiProductResponse.fromJson(Map<String, dynamic> json) => ApiProductResponse(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
        accessToken: json["access_token"],
        tokenType: json["token_type"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "access_token": accessToken,
        "token_type": tokenType,
    };
}

class Datum {
    int productId;
    String title;
    String productFile;

    Datum({
        required this.productId,
        required this.title,
        required this.productFile,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        productId: json["product_id"],
        title: json["title"],
        productFile: json["product_file"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "title": title,
        "product_file": productFile,
    };
}
