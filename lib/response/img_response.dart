// To parse this JSON data, do
//
//     final imagesResponse = imagesResponseFromJson(jsonString);

import 'dart:convert';

ImagesResponse imagesResponseFromJson(String str) => ImagesResponse.fromJson(json.decode(str));

String imagesResponseToJson(ImagesResponse data) => json.encode(data.toJson());

class ImagesResponse {
  ImagesResponse({
    this.id,
    this.name,
    this.url,
    this.width,
    this.height,
    this.boxCount,
  });

  String? id;
  String? name;
  String? url;
  int? width;
  int? height;
  int? boxCount;

  factory ImagesResponse.fromJson(Map<String, dynamic> json) => ImagesResponse(
    id: json["id"],
    name: json["name"],
    url: json["url"],
    width: json["width"],
    height: json["height"],
    boxCount: json["box_count"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "url": url,
    "width": width,
    "height": height,
    "box_count": boxCount,
  };
}
