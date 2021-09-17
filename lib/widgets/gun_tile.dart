import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';
import 'package:makebulletsbeta/controller/main_store.dart';
import 'package:makebulletsbeta/entities/gun.dart';
import 'package:provider/provider.dart';

class GunTile extends StatelessWidget {
  Gun gun = Gun();
  int PorcClass = 0;
  var _numberFormat =
      NumberFormat.simpleCurrency(decimalDigits: 0, name: "", locale: "pt_BR");
  bool _gunAnt = false;
  int _gunIndex = 0;
  int _gunTypeIndex = 0;

  GunTile(this.gun, this.PorcClass);

  AudioPlayer player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    MainStore mainStore = Provider.of<MainStore>(context);
    _gunIndex = gun.id - 2;
    _gunTypeIndex = gun.gunTypeId;
    if(_gunIndex < 0){
      _gunIndex = 0;
      _gunTypeIndex -= 1;
      if(_gunTypeIndex < 0){
        _gunTypeIndex = 0;
      }
    }
    _gunAnt = mainStore.dataBase.gunType[_gunTypeIndex].gun[_gunIndex].lock;
    return ListTile(
      leading: Stack(
        children: [
          Positioned(
            bottom: 7,
            right: 0,
            child: LockCircleAvatar(gun.lock),
          ),
          CircleAvatar(
              radius: 25,
              backgroundColor: Colors.transparent,
              child: ClipRRect(
                child: Image.asset(gun.urlImag, fit: BoxFit.scaleDown),
              )),
        ],
      ),
      title: Text(gun.title + " (${gun.perk.porcBuff}%)"),
      subtitle: Text("+R\$ ${gun.price}" +
          " + ${gun.price * (gun.perk.porcBuff + PorcClass) ~/ 100}"),
      trailing: Container(
        padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
        width: 120,
        height: 35,
        child: ElevatedButton.icon(
          onPressed: gun.lock || !_gunAnt
              ? null
              : () {
                  if (mainStore.dataBase.money >= gun.priceToUnlock) {
                    mainStore.dataBase.money -= gun.priceToUnlock;
                    gun.lock = true;
                    mainStore.dataBase.gun = gun;
                    gun.perk.urlImag = gun.urlImag;
                    mainStore.perks[1] = gun.perk;
                    mainStore.dataBase.gunType[gun.gunTypeId].perk.urlImag =
                        mainStore.dataBase.gunType[gun.gunTypeId].urlImag;
                    mainStore.perks[2] =
                        mainStore.dataBase.gunType[gun.gunTypeId].perk;
                    mainStore.setMoney(mainStore.dataBase.money);
                    (context as Element).markNeedsBuild();
                    playSound();
                  }
                },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (gun.lock || !_gunAnt) {
                  return Colors.grey;
                } else {
                  if (mainStore.dataBase.money >= gun.priceToUnlock) {
                    return Colors.green;
                  } else {
                    return Colors.red; // Use the component's default.
                  }
                }
              },
            ),
          ),
          icon: Icon(Icons.shopping_cart),
          label: Text(
            _numberFormat.format(gun.priceToUnlock),
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
      ),
    );
  }

  Future<void> playSound() async {
    await player.setAsset('sounds/BuyGunSound.mp3');
    player.play();
  }

  CircleAvatar LockCircleAvatar(bool lock) {
    if (lock) {
      return CircleAvatar(
          radius: 8,
          backgroundColor: Colors.green,
          child: ClipRRect(
            child: Icon(
              Icons.done,
              color: Colors.white,
              size: 13,
            ),
          ));
    } else {
      return CircleAvatar(
          radius: 8,
          backgroundColor: Colors.red,
          child: ClipRRect(
            child: Icon(
              Icons.lock,
              color: Colors.white,
              size: 12,
            ),
          ));
    }
  }
}
