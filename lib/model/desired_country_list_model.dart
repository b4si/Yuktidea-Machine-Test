import 'dart:convert';

DesiredCountryListModel desiredCountryListModelFromJson(String str) =>
    DesiredCountryListModel.fromJson(json.decode(str));

class DesiredCountryListModel {
  bool? status;
  String? message;
  Data? data;

  DesiredCountryListModel({
    this.status,
    this.message,
    this.data,
  });

  factory DesiredCountryListModel.fromJson(Map<String, dynamic> json) =>
      DesiredCountryListModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  String? profileStatus;
  String? role;
  dynamic selectedCountry;
  List<Country>? countries;

  Data({
    this.profileStatus,
    this.role,
    this.selectedCountry,
    this.countries,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        profileStatus: json["profile_status"],
        role: json["role"],
        selectedCountry: json["selected_country"],
        countries: List<Country>.from(
            json["countries"].map((x) => Country.fromJson(x))),
      );
}

class Country {
  int? id;
  String? name;
  String? flag;
  String? image;

  Country({
    this.id,
    this.name,
    this.flag,
    this.image,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        name: json["name"],
        flag: json["flag"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "flag": flag,
        "image": image,
      };
}
