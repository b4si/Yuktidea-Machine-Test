import 'dart:convert';

CountryListModel countryListModelFromJson(String str) =>
    CountryListModel.fromJson(json.decode(str));

class CountryListModel {
  bool? status;
  String? message;
  List<Datum>? data;

  CountryListModel({
    this.status,
    this.message,
    this.data,
  });

  factory CountryListModel.fromJson(Map<String, dynamic> json) =>
      CountryListModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  int? id;
  String? name;
  String? code;
  String? telCode;
  String? timezone;
  String? flag;
  String? createdAt;
  String? updatedAt;

  Datum({
    this.id,
    this.name,
    this.code,
    this.telCode,
    this.timezone,
    this.flag,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        telCode: json["tel_code"],
        timezone: json["timezone"],
        flag: json["flag"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "tel_code": telCode,
        "timezone": timezone,
        "flag": flag,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
