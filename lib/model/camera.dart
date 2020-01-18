// To parse this JSON data, do
//
//     final device = deviceFromJson(jsonString);

import 'dart:convert';

Camera deviceFromJson(String str) => Camera.fromJson(json.decode(str));

String deviceToJson(Camera data) => json.encode(data.toJson());

class Camera {
  String name;
  String image;
  bool status;
  String desc;
  String camera;

  Camera({
    this.name,
    this.image,
    this.status,
    this.desc,
    this.camera,
  });

  factory Camera.fromJson(Map<String, dynamic> json) => Camera(
    name: json["name"],
    image: json["image"],
    status: json["status"],
    desc: json["desc"],
    camera: json["camera"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "status": status,
    "desc": desc,
    "camera": camera,
  };
}
