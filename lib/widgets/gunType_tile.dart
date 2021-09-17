import 'package:flutter/material.dart';
import 'package:makebulletsbeta/controller/main_store.dart';
import 'package:makebulletsbeta/entities/data.dart';
import 'package:makebulletsbeta/entities/gunType.dart';
import 'package:provider/provider.dart';

import 'gun_tile.dart';

class GunTypeTile extends StatelessWidget {
  GunType gunType = GunType();

  GunTypeTile(this.gunType);

  @override
  Widget build(BuildContext context) {
    MainStore mainStore = Provider.of<MainStore>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: ExpansionTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey,
          child: ClipRRect(
            child: Image.asset(gunType.urlImag,
              width: 40,
              height: 60,
            fit: BoxFit.scaleDown,
            ),
          ),
        ),
        title: Text(
          gunType.title + " (${gunType.perk.porcBuff}%)",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        children: [
          SingleChildScrollView(
            child: Container(
              child: ListView.builder(
                itemCount: gunType.gun.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                return GunTile(gunType.gun[index],gunType.perk.porcBuff);
              }),
            ),
          )
        ],
      ),
    );
  }
}

