import 'package:intl/intl.dart';
import 'package:makebulletsbeta/entities/data.dart';
import 'package:makebulletsbeta/entities/perk.dart';
import 'dart:convert';
import 'dart:io';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';

import '../carregarDadosBase.dart';

part 'main_store.g.dart';

class MainStore = _MainStore with _$MainStore;

abstract class _MainStore with Store {
  var _numberFormat = NumberFormat.simpleCurrency(locale: "pt_BR");
  double appVersion = 1.4;

  @observable
  Data dataBase = Data();

  @observable
  List<Perk> perks = [];

  _MainStore() {
    _readData().then((string) {
      if (string == "null") {
        appVersion = 1.0;
        dataBase = CarregarDadosBase(appVersion).loadBaseGame();
        _saveData();

        //dataBase.money = 150000;

        //global 0
        perks.add(dataBase.perk);
        //Arma 1
        perks.add(dataBase.gun.perk);
        //Class 2
        perks.add(dataBase.gunType[dataBase.gun.gunTypeId].perk);

        clickCalc();
      } else {
        //Map<String, dynamic> userMap = jsonDecode(string);
        Map<String, dynamic> userMap = json.decode(string);
        dataBase = Data.fromJson(userMap);

        // appVersion = 1.2;
        //substituir por verificar versão
        if (appVersion > dataBase.appVersion) {
          //dataBase = CarregarDadosBase(dataBase.appVersion).loadAtt(dataBase);
          dataBase = CarregarDadosBase(appVersion).loadBaseGame();
          _saveData();
        }

        //dataBase.money = 150000;

        //global 0
        dataBase.perk.urlImag = 'images/MainFactory.png';
        perks.add(dataBase.perk);
        //Arma 1
        dataBase.gun.perk.urlImag = dataBase.gun.urlImag;
        perks.add(dataBase.gun.perk);
        //Class 2
        dataBase.gunType[dataBase.gun.gunTypeId].perk.urlImag =
            dataBase.gunType[dataBase.gun.gunTypeId].urlImag;
        perks.add(dataBase.gunType[dataBase.gun.gunTypeId].perk);

        clickCalc();
      }
    });
    // _dataBase.money = 150000;
  }

  @action
  void setMoney(int money) {
    dataBase = dataBase;
    _saveData();
  }

  @action
  void setPerk() {
    perks = perks;
  }

  void incrementMoney() {
    var buff = dataBase.gun.price *
        ((perks[0].porcBuff + perks[1].porcBuff + perks[2].porcBuff) / 100);
    dataBase.money += dataBase.gun.price + (buff.toInt());
    setMoney(dataBase.money);
  }

  Future<void> clickCalc() async {
    await Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 1500));
      incrementMoney();
      return true;
    });
  }

//* Metodos Json ***********************
  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> _saveData() async {
    String data = jsonEncode(dataBase);
    //String data = json.encode(_dataBase);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String> _readData() async {
    try {
      final file = await _getFile();
      String teste = await file.readAsString();
      return teste;
    } catch (e) {
      return "null";
    }
  }
}
