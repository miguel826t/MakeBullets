class Perk {
  int id = 1;
  String title = "";
  String descr = "";
  String urlImag = "";
  int nivel = 0;
  int price = 100;
  int procAument = 1;
  int porcBuff = 1;
  int maxUpdt = 0;

  Perk();
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
    urlImag = json['urlImag'];
    nivel = json['nivel'];
    price = json['price'];
    procAument = json['procAument'];
    porcBuff = json['porcBuff'];
    maxUpdt = json['maxUpdt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['descr'] = this.descr;
    data['urlImag'] = this.urlImag;
    data['nivel'] = this.nivel;
    data['price'] = this.price;
    data['procAument'] = this.procAument;
    data['porcBuff'] = this.porcBuff;
    data['maxUpdt'] = this.maxUpdt;
    return data;
  }
}