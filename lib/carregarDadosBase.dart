import 'package:makebulletsbeta/entities/gunType.dart';
import 'package:makebulletsbeta/entities/perk.dart';

import 'entities/data.dart';
import 'entities/gun.dart';

class CarregarDadosBase{

  double appVersion = 1;


  CarregarDadosBase(this.appVersion);

  loadBaseGame(){
    Data dado = Data();
    dado.perk = loadPerks(1,"Fabrica","Aumenta 3% toda a produção",1,500,3,0);
//Pistolas
    GunType pistolas = GunType();
      pistolas.id = 0;
      pistolas.title = "Pistolas";
      pistolas.urlImag = "images/Pistolas.png";
      pistolas.perk =
          loadPerks(pistolas.id,"Categoria de pistolas","Aumenta 5% o valor das armas",1,200,5,0);

      pistolas.gun.add(loadGun(1,"Revolver",5,"images/Revolver38.png",true,pistolas.id));
      dado.gun = pistolas.gun[0];

      pistolas.gun.add(
          loadGun(2,"Glock",10,"images/Glock.png",false,pistolas.id));
      pistolas.gun.add(
          loadGun(3,"Desert Eagle",15,"images/DesertEagle.png",false,pistolas.id));
    pistolas.gun.add(
        loadGun(4,"Beretta",20,"images/Beretta.png",false,pistolas.id));
    pistolas.gun.add(
        loadGun(5,"M1911",25,"images/M1911.png",false,pistolas.id));


    dado.gunType.add(pistolas);
//Fuzis
    GunType fuzis = GunType();
    fuzis.id = 1;
    fuzis.title = "Fuzis";
    fuzis.urlImag = "images/Fuzis.png";
    fuzis.perk =
        loadPerks(fuzis.id,"Categoria de fuzis","Aumenta em 5% o valor das armas",1,200,5,0);
    fuzis.gun.add(
        loadGun(1,"M4A1",50,"images/M4A1.png",false,fuzis.id));
    fuzis.gun.add(
        loadGun(2,"M4A4",55,"images/M4A4.png",false,fuzis.id));
    fuzis.gun.add(
        loadGun(3,"AK47",60,"images/AK47.png",false,fuzis.id));
    fuzis.gun.add(
        loadGun(4,"AR15",70,"images/AR15.png",false,fuzis.id));
    fuzis.gun.add(
        loadGun(5,"Parafal",80,"images/Parafal-762.png",false,fuzis.id));
    fuzis.gun.add(
        loadGun(6,"SCARH",90,"images/SCARH.png",false,fuzis.id));
    fuzis.gun.add(
        loadGun(7,"SG553",95,"images/SG-553.png",false,fuzis.id));
    fuzis.gun.add(
        loadGun(8,"TAR21",100,"images/TAR-21.png",false,fuzis.id));
    dado.gunType.add(fuzis);

    dado.appVersion = appVersion;

    return dado;
  }

  loadAtt(Data dado){
    GunType pistolas = dado.gunType[0];
    GunType fuzis = dado.gunType[1];

    //versão 1.1 do sistema
    if (appVersion < 1.1){

      //Aumentar %Producao da fabrica de 1 para 5
      dado.perk.procAument = 1;
      dado.perk.descr = "Aumenta ${dado.perk.procAument}% toda a produção";

      pistolas.gun.add(
          loadGun(4,"Beretta",20,"images/Beretta.png",false,pistolas.id));
      pistolas.gun.add(
          loadGun(5,"M1911",25,"images/M1911.png",false,pistolas.id));

      dado.appVersion += 0.1;
    }

   // dado.appVersion = appVersion;
    return dado;
  }

  loadPerks(int id,String title,String descr,int nivel,int price,int procAument,int porcBuff){
    Perk perk = Perk();
    perk.id = id;
    perk.title = title;
    perk.descr = descr;
    perk.nivel = nivel;
    perk.price = price;
    perk.procAument = procAument;
    perk.porcBuff = porcBuff;
    return perk;
  }

  loadGun(int id,String title,int price,String urlImag,bool lock,int gunTypeId){
    Gun gun = Gun();
    gun.id = id;
    gun.title = title;
    gun.urlImag = urlImag;
    gun.price = price;
    gun.priceToUnlock = price * 350;
    gun.lock = lock;
    gun.gunTypeId = gunTypeId;
    int perkPrice = (gun.priceToUnlock / 15).toInt();
    gun.perk = loadPerks(id,"Arma - $title","Aumenta 10% o valor da arma",1,perkPrice,10,0);

    return gun;
  }



}