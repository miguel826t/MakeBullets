
import 'package:makebulletsbeta/entities/perk.dart';

import 'gun.dart';
import 'gunType.dart';

class Data {
  int money = 0;
  Gun gun = Gun();
  Perk perk = Perk();
  List<GunType> gunType = [];
  double appVersion = 1;

  Data(){

  }
  //Data({this.money, this.gun, this.perk, this.gunType});

  Data.fromJson(Map<String, dynamic> json) {
    try{
      money = json['money'];
      gun = (json['gun'] != null ? new Gun.fromJson(json['gun']) : Gun());
      perk = (json['perk'] != null ? new Perk.fromJson(json['perk']) : Perk());
      if (json['gunType'] != null) {
        gunType = [];
        json['gunType'].forEach((v) {
          gunType.add(new GunType.fromJson(v));
        });
      }
      appVersion = json['appVersion'];
    }catch(e){
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['money'] = this.money;
    if (this.gun != null) {
      data['gun'] = this.gun.toJson();
    }
    if (this.perk != null) {
      data['perk'] = this.perk.toJson();
    }
    if (this.gunType != null) {
      data['gunType'] = this.gunType.map((v) => v.toJson()).toList();
    }
    data['appVersion'] = this.appVersion;
    return data;
  }
}