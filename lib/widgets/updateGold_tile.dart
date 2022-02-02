import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';
import 'package:makebulletsbeta/controller/main_store.dart';
import 'package:makebulletsbeta/entities/perk.dart';
import 'package:provider/provider.dart';

class UpdateGoldTile extends StatelessWidget {
  Perk perk = Perk();
  var _numberFormat =
  NumberFormat.simpleCurrency(decimalDigits: 0, name: "", locale: "pt_BR");

  UpdateGoldTile(this.perk);

  AudioPlayer player = AudioPlayer();
  bool maxLevel = false;

  @override
  Widget build(BuildContext context) {
    MainStore mainStore = Provider.of<MainStore>(context);
    maxLevel = perk.nivel == perk.maxUpdt;
    return ElevatedButton(
      onPressed: mainStore.dataBase.goldBullet < perk.price || maxLevel ? null :(){
        if(mainStore.dataBase.goldBullet >= perk.price){
          perk.nivel += 1;
          mainStore.dataBase.goldBullet -= perk.price;
          perk.price = (perk.price * 1.8).toInt();
          perk.porcBuff += perk.procAument;
          mainStore.setMoney(mainStore.dataBase.goldBullet);
          mainStore.setPerk();
          playSound();
          (context as Element).markNeedsBuild();
        }
      },
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          side: BorderSide(
            width: 5.0,
            color: Colors.white,
          ),
          primary: Colors.grey),
      child: Row(
        children: [
          Expanded(
            flex: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Image.asset(
                perk.urlImag,
                fit: BoxFit.scaleDown,
                height: 40,
                width: 40,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "+${perk.porcBuff}",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(1, 5, 1, 0),
                  child: Text(
                    perk.descr,
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 1, 5, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(perk.nivel.toString()+"/"+perk.maxUpdt.toString(),
                    style: TextStyle(color: Colors.black, fontSize: 20)),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 5, 2),
                    child: Text(getUpdtPrice(),
                        style: TextStyle(color: getColor(mainStore.dataBase.goldBullet), fontSize: 17)),
                  ),
                  Image.asset(
                    'images/MainBullet.png',
                    fit: BoxFit.fill,
                    height: 25,
                    width: 25,
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> playSound() async {
    await player.setAsset('sounds/PerkSound.mp3');
    player.play();
  }

  Color getColor(money) {
    if(money < perk.price){
      return Colors.red;
    }
    return Colors.black;
  }

  String getUpdtPrice() {
    if (maxLevel) {
      return "Máximo";
    } else {
      return _numberFormat.format(perk.price);
    }
  }

}
