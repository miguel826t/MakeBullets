class Perk {
  int id = 1;
  String title = "";
  String descr = "";
  String urlImag = "";
  int nivel = 1;
  int price = 100;
  int procAument = 1;
  int porcBuff = 1;

  Perk(){

  }
  //Perk(
  //    {this.id,
  //      this.title,
  //      this.descr,
  //      this.nivel,
  //      this.price,
  //      this.procAument,
  //      this.porcBuff});

  Perk.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    descr = json['descr'];
    nivel = json['nivel'];
    price = json['price'];
    procAument = json['procAument'];
    porcBuff = json['porcBuff'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['descr'] = this.descr;
    data['nivel'] = this.nivel;
    data['price'] = this.price;
    data['procAument'] = this.procAument;
    data['porcBuff'] = this.porcBuff;
    return data;
  }
}