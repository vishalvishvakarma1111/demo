// To parse this JSON data, do
//
//     final apitResponse = apitResponseFromJson(jsonString);

import 'dart:convert';

List<ApiResponse> apiResponseFromJson(String str) => List<ApiResponse>.from(json.decode(str).map((x) => ApiResponse.fromJson(x)));


class ApiResponse {
  ApiResponse({
    required this.userId,
    required this.id,
    required this.title,
  });

  int userId;
  int id;
  String title;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
  };
}
