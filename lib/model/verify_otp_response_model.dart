import 'dart:convert';

VerifyOtpResponseModel verifyOtpResponseModelFromJson(String str) =>
    VerifyOtpResponseModel.fromJson(json.decode(str));

class VerifyOtpResponseModel {
  bool? status;
  String? message;
  Data? data;

  VerifyOtpResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) =>
      VerifyOtpResponseModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  String? profileStatus;
  String? role;
  String? phone;
  String? phoneVerifiedAt;
  String? accessToken;
  String? tokenType;
  int? expiresIn;

  Data({
    this.profileStatus,
    this.role,
    this.phone,
    this.phoneVerifiedAt,
    this.accessToken,
    this.tokenType,
    this.expiresIn,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        profileStatus: json["profile_status"],
        role: json["role"],
        phone: json["phone"],
        phoneVerifiedAt: json["phone_verified_at"],
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
      );

  Map<String, dynamic> toJson() => {
        "profile_status": profileStatus,
        "role": role,
        "phone": phone,
        "phone_verified_at": phoneVerifiedAt,
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
      };
}
