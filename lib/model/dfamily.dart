// To parse this JSON data, do
//
//     final device = deviceFromJson(jsonString);

import 'dart:convert';

DFamily deviceFromJson(String str) => DFamily.fromJson(json.decode(str));

String deviceToJson(DFamily data) => json.encode(data.toJson());

class DFamily {
  String name;
  String image;
  bool status;
  String desc;
  bool light;
  bool pump;
  bool fan;

  DFamily({
    this.name,
    this.image,
    this.status,
    this.desc,
    this.light,
    this.pump,
    this.fan,
  });

  factory DFamily.fromJson(Map<String, dynamic> json) => DFamily(
    name: json["name"],
    image: json["image"],
    status: json["status"],
    desc: json["desc"],
    light: json["light"],
    pump: json["pump"],
    fan: json["fan"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "status": status,
    "desc": desc,
    "light": light,
    "pump": pump,
    "fan": fan,
  };
}
