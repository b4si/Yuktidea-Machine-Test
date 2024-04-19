import 'dart:convert';

TermsAndConditionsModel termsAndConditionsModelFromJson(String str) =>
    TermsAndConditionsModel.fromJson(json.decode(str));

class TermsAndConditionsModel {
  bool? status;
  String? message;
  Data? data;

  TermsAndConditionsModel({
    this.status,
    this.message,
    this.data,
  });

  factory TermsAndConditionsModel.fromJson(Map<String, dynamic> json) =>
      TermsAndConditionsModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  int? id;
  String? title;
  String? content;
  String? publishedAt;
  int? enabled;
  String? createdAt;
  String? updatedAt;

  Data({
    this.id,
    this.title,
    this.content,
    this.publishedAt,
    this.enabled,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        publishedAt: json["published_at"],
        enabled: json["enabled"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "published_at": publishedAt,
        "enabled": enabled,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
