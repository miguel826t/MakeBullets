import 'package:makebulletsbeta/entities/gunType.dart';
import 'package:makebulletsbeta/entities/perk.dart';

import 'entities/data.dart';
import 'entities/gun.dart';

class CarregarDadosBase{

  double appVersion = 1;
  int _priceIncrement = 0;



  CarregarDadosBase(this.appVersion);

  loadBaseGame(){
    Data dado = Data();
//Perks Gold********************************************************************
    dado.goldPerks.add(
        loadPerks(0, "Bala de ouro","+1 bala produzida","images/MainBullet.png", 0, 10, 1, 0,50));
    dado.goldPerks.add(
        loadPerks(1, "Velocidade","Aumentar a velocidade de produção","images/MainBullet.png", 0, 20, 1,1,10));


//Perk da fabrica***************************************************************
    dado.perk = loadPerks(1,"Fabrica","Aumenta 3% toda a produção","images/MainFactory.png",0,600,3,0,100);
//Pistolas**********************************************************************
    GunType pistolas = GunType();
      pistolas.id = 0;
      pistolas.title = "Pistolas";
      pistolas.urlImag = "images/Pistolas.png";
      pistolas.perk =
          loadPerks(pistolas.id,"Categoria de pistolas","Aumenta 5% o valor das armas",pistolas.urlImag,0,500,5,0,40);

      pistolas.gun.add(loadGun(0,"Revolver",5,"images/Revolver38.png",true,pistolas.id));
      dado.gun = pistolas.gun[0];

      pistolas.gun.add(
          loadGun(1,"Glock",10,"images/Glock.png",false,pistolas.id));
      pistolas.gun.add(
          loadGun(2,"Desert Eagle",15,"images/DesertEagle.png",false,pistolas.id));
    pistolas.gun.add(
        loadGun(3,"Beretta",20,"images/Beretta.png",false,pistolas.id));
    pistolas.gun.add(
        loadGun(4,"M1911",25,"images/M1911.png",false,pistolas.id));
    pistolas.gun.add(
        loadGun(5,"P2000",30,"images/P2000.png",false,pistolas.id));
    pistolas.gun.add(
        loadGun(6,"USP-S",35,"images/USP-S.png",false,pistolas.id));
    pistolas.gun.add(
        loadGun(7,"P250",40,"images/P250.png",false,pistolas.id));
    pistolas.gun.add(
        loadGun(8,"Tec-9",50,"images/Tec-9.png",false,pistolas.id));
//
    dado.gunType.add(pistolas);
//Escopetas******************************************************************************
    GunType escopetas = GunType();
    escopetas.id = 1;
    escopetas.title = "Escopetas";
    escopetas.urlImag = "images/Escopetas.png";
    escopetas.perk =
        loadPerks(escopetas.id,"Categoria de escopetas","Aumenta 5% o valor das armas",escopetas.urlImag,0,5000,5,0,40);
    escopetas.gun.add(
        loadGun(0,"S1986",55,"images/S1986.png",false,escopetas.id));
    escopetas.gun.add(
        loadGun(1,"Benelli M4",50,"images/benelli_m4.png",false,escopetas.id));
    escopetas.gun.add(
        loadGun(2,"S12K",65,"images/S12K.png",false,escopetas.id));
    escopetas.gun.add(
        loadGun(3,"KSG",70,"images/ksg.png",false,escopetas.id));
    escopetas.gun.add(
        loadGun(4,"Atchisson",80,"images/Atchisson.png",false,escopetas.id));
    dado.gunType.add(escopetas);
//Subs**************************************************************************
    GunType subs = GunType();
    subs.id = 2;
    subs.title = "Sub metralhadoras";
    subs.urlImag = "images/SubMetralhadoras.png";
    subs.perk =
        loadPerks(subs.id,"Categoria de sub metralhadoras","Aumenta em 5% o valor das armas",subs.urlImag,0,10000,5,0,40);
    subs.gun.add(
        loadGun(0,"MC10",85,"images/MC10.png",false,subs.id));
    subs.gun.add(
        loadGun(1,"PPbizon",90,"images/PPbizon.png",false,subs.id));
    subs.gun.add(
        loadGun(2,"MP5",95,"images/MP5.png",false,subs.id));
    subs.gun.add(
        loadGun(3,"MP7",100,"images/MP7.png",false,subs.id));
    subs.gun.add(
        loadGun(4,"Colt9",105,"images/Colt9.png",false,subs.id));
    subs.gun.add(
        loadGun(5,"UMP-45",110,"images/UMP45.png",false,subs.id));
    subs.gun.add(
        loadGun(6,"P90",115,"images/P90.png",false,subs.id));
    subs.gun.add(
        loadGun(7,"MP5-PRO",125,"images/MP5-PRO.png",false,subs.id));
    dado.gunType.add(subs);
//Fuzis*************************************************************************
    GunType fuzis = GunType();
    fuzis.id = 3;
    fuzis.title = "Fuzis";
    fuzis.urlImag = "images/Fuzis.png";
    fuzis.perk =
        loadPerks(fuzis.id,"Categoria de fuzis","Aumenta em 5% o valor das armas",fuzis.urlImag ,0,20000,5,0,40);
    fuzis.gun.add(
        loadGun(0,"M4A1",130,"images/M4A1.png",false,fuzis.id));
    fuzis.gun.add(
        loadGun(1,"M4A4",135,"images/M4A4.png",false,fuzis.id));
    fuzis.gun.add(
        loadGun(2,"AK47",140,"images/AK47.png",false,fuzis.id));
    fuzis.gun.add(
        loadGun(3,"AR15",145,"images/AR15.png",false,fuzis.id));
    fuzis.gun.add(
        loadGun(4,"Parafal",150,"images/Parafal-762.png",false,fuzis.id));
    fuzis.gun.add(
        loadGun(5,"SCARH",160,"images/SCARH.png",false,fuzis.id));
    fuzis.gun.add(
        loadGun(6,"SG553",170,"images/SG-553.png",false,fuzis.id));
    fuzis.gun.add(
        loadGun(7,"TAR21",175,"images/TAR-21.png",false,fuzis.id));
    fuzis.gun.add(
        loadGun(8,"IA2",180,"images/IA2.png",false,fuzis.id));
    fuzis.gun.add(
        loadGun(9,"AUG",185,"images/AUG.png",false,fuzis.id));
    fuzis.gun.add(
        loadGun(10,"FAMAS",190,"images/FAMAS.png",false,fuzis.id));
    fuzis.gun.add(
        loadGun(11,"X80P",195,"images/X80P.png",false,fuzis.id));
    fuzis.gun.add(
        loadGun(12,"M4 PRO",205,"images/m4-PRO.png",false,fuzis.id));
    dado.gunType.add(fuzis);
//Snipers***********************************************************************
    GunType snipers = GunType();
    snipers.id = 4;
    snipers.title = "Snipers";
    snipers.urlImag = "images/Snipers.png";
    snipers.perk =
        loadPerks(snipers.id,"Categoria de snipers","Aumenta em 5% o valor das armas",snipers.urlImag,0,40000,5,0,40);
    snipers.gun.add(
        loadGun(0,"M14",210,"images/M14.png",false,snipers.id));
    snipers.gun.add(
        loadGun(1,"M24",215,"images/M24.png",false,snipers.id));
    snipers.gun.add(
        loadGun(2,"Dragunov",220,"images/Dragunov.png",false,snipers.id));
    snipers.gun.add(
        loadGun(3,"FNAR",225,"images/FNAR.png",false,snipers.id));
    snipers.gun.add(
        loadGun(4,"SR25",230,"images/SR25.png",false,snipers.id));
    snipers.gun.add(
        loadGun(5,"AWP",235,"images/AWP.png",false,snipers.id));
    snipers.gun.add(
        loadGun(6,"FN",240,"images/FN.png",false,snipers.id));
    snipers.gun.add(
        loadGun(7,"Savage",250,"images/Savage.png",false,snipers.id));
    dado.gunType.add(snipers);


    dado.appVersion = appVersion;
    return dado;
  }

  loadAtt(Data dado){
    return dado;
  }

  loadGun(int id,String title,int price,String urlImag,bool lock,int gunTypeId){
    Gun gun = Gun();
    gun.id = id;
    gun.title = title;
    gun.urlImag = urlImag;
    gun.price = price;
    gun.priceToUnlock = price * (300 + _priceIncrement);
    _priceIncrement += 50;
    gun.lock = lock;
    gun.gunTypeId = gunTypeId;
    int perkPrice = (gun.priceToUnlock / 10).toInt();
    gun.perk = loadPerks(id,"Arma - $title","Aumenta 10% o valor da arma",urlImag,0,perkPrice,10,0,40);

    return gun;
  }

  loadPerks(int id,String title,String descr,String urlImag,int nivel,int price,int procAument,int porcBuff,int maxUpdt){
    Perk perk = Perk();
    perk.id = id;
    perk.title = title;
    perk.descr = descr;
    perk.urlImag = urlImag;
    perk.nivel = nivel;
    perk.price = price;
    perk.procAument = procAument;
    perk.porcBuff = porcBuff;
    perk.maxUpdt = maxUpdt;
    return perk;
  }





}