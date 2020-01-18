// To parse this JSON data, do
//
//     final device = deviceFromJson(jsonString);

import 'dart:convert';

Device deviceFromJson(String str) => Device.fromJson(json.decode(str));

String deviceToJson(Device data) => json.encode(data.toJson());

class Device {
  String name;
  String image;
  bool status;
  String desc;

  Device({
    this.name,
    this.image,
    this.status,
    this.desc,
  });

  factory Device.fromJson(Map<String, dynamic> json) => Device(
    name: json["name"],
    image: json["image"],
    status: json["status"],
    desc: json["desc"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "status": status,
    "desc": desc,
  };
}
