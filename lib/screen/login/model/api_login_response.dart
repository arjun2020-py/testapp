// To parse this JSON data, do
//
//     final apiLoginRespose = apiLoginResposeFromJson(jsonString);

import 'dart:convert';

ApiLoginRespose apiLoginResposeFromJson(String str) => ApiLoginRespose.fromJson(json.decode(str));

String apiLoginResposeToJson(ApiLoginRespose data) => json.encode(data.toJson());

class ApiLoginRespose {
    bool status;
    String accessToken;
    String tokenType;
    Data data;
    String message;

    ApiLoginRespose({
        required this.status,
        required this.accessToken,
        required this.tokenType,
        required this.data,
        required this.message,
    });

    factory ApiLoginRespose.fromJson(Map<String, dynamic> json) => ApiLoginRespose(
        status: json["status"],
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "access_token": accessToken,
        "token_type": tokenType,
        "data": data.toJson(),
        "message": message,
    };
}

class Data {
    UserDetails userDetails;
    String pageToRedirect;

    Data({
        required this.userDetails,
        required this.pageToRedirect,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userDetails: UserDetails.fromJson(json["user_details"]),
        pageToRedirect: json["page_to_redirect"],
    );

    Map<String, dynamic> toJson() => {
        "user_details": userDetails.toJson(),
        "page_to_redirect": pageToRedirect,
    };
}

class UserDetails {
    int id;
    int userType;
    String firstName;
    String lastName;
    String userName;
    String email;
    String mobile;

    UserDetails({
        required this.id,
        required this.userType,
        required this.firstName,
        required this.lastName,
        required this.userName,
        required this.email,
        required this.mobile,
    });

    factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["id"],
        userType: json["user_type"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        userName: json["user_name"],
        email: json["email"],
        mobile: json["mobile"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_type": userType,
        "first_name": firstName,
        "last_name": lastName,
        "user_name": userName,
        "email": email,
        "mobile": mobile,
    };
}
