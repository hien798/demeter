// To parse this JSON data, do
//
//     final project = projectFromJson(jsonString);

import 'dart:convert';

Project projectFromJson(String str) => Project.fromJson(json.decode(str));

String projectToJson(Project data) => json.encode(data.toJson());

class Project {
  String name;
  String image;
  String camera;

  Project({
    this.name,
    this.image,
    this.camera,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
    name: json["name"],
    image: json["image"],
    camera: json["camera"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "camera": camera,
  };
}
