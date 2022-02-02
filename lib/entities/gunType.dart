import 'package:makebulletsbeta/entities/perk.dart';

import 'gun.dart';

class GunType {
  int id = 0;
  String title = "";
  Perk perk = Perk();
  List<Gun> gun = [];
  String urlImag = "";

  GunType();
 // GunType({this.id, this.title, this.perk, this.gun});

  GunType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    urlImag = json['urlImag'];
    perk = (json['perk'] != null ? new Perk.fromJson(json['perk']) : Perk());
    if (json['gun'] != null) {
      gun = [];
      json['gun'].forEach((v) {
        gun.add(new Gun.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['urlImag'] = this.urlImag;
    if (this.perk != null) {
      data['perk'] = this.perk.toJson();
    }
    if (this.gun != null) {
      data['gun'] = this.gun.map((v) => v.toJson()).toList();
    }
    return data;
  }
}