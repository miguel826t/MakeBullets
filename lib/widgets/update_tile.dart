import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';
import 'package:makebulletsbeta/controller/main_store.dart';
import 'package:makebulletsbeta/entities/perk.dart';
import 'package:provider/provider.dart';

class UpdateTile extends StatelessWidget {
  Perk perk = Perk();
  var _numberFormat =
  NumberFormat.simpleCurrency(decimalDigits: 0, name: "", locale: "pt_BR");

  UpdateTile(this.perk);

  AudioPlayer player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    MainStore mainStore = Provider.of<MainStore>(context);
    return ElevatedButton(
      onPressed: mainStore.dataBase.money < perk.price ? null :(){
        if(mainStore.dataBase.money >= perk.price){
          perk.nivel += 1;
          mainStore.dataBase.money -= perk.price;
          perk.price = (perk.price * 1.5).toInt();
          perk.porcBuff += perk.procAument;
          mainStore.setMoney(mainStore.dataBase.money);
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
                  "(${perk.porcBuff}%)",
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
                Text(perk.nivel.toString(),
                    style: TextStyle(color: Colors.black, fontSize: 20)),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 5, 2),
                    child: Text(_numberFormat.format(perk.price),
                        style: TextStyle(color: getColor(mainStore.dataBase.money), fontSize: 20)),
                  ),
                  Image.asset(
                    'images/Bullet1-Back.png',
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
}
