import 'package:makebulletsbeta/entities/perk.dart';

class Gun {
  int id = 1;
  String title = "";
  int price = 5;
  int priceToUnlock = 0;
  bool lock = false;
  int gunTypeId = 1;
  String urlImag = "";
  Perk perk = Perk();

  Gun(){

  }
  //Gun({this.id, this.title, this.price, this.lock, this.gunTypeId, this.perk});

  Gun.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    priceToUnlock = json['priceToUnlock'];
    lock = json['lock'];
    gunTypeId = json['gunTypeId'];
    urlImag = json['urlImag'];
    perk = json['perk'] != null ? new Perk.fromJson(json['perk']) : Perk();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['priceToUnlock'] = this.priceToUnlock;
    data['lock'] = this.lock;
    data['gunTypeId'] = this.gunTypeId;
    data['urlImag'] = this.urlImag;
    if (this.perk != null) {
      data['perk'] = this.perk.toJson();
    }
    return data;
  }
}