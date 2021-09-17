import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:makebulletsbeta/carregarDadosBase.dart';
import 'package:makebulletsbeta/controller/main_store.dart';
import 'package:makebulletsbeta/entities/data.dart';
import 'package:makebulletsbeta/entities/perk.dart';
import 'package:makebulletsbeta/screen/home_tab.dart';
import 'package:makebulletsbeta/widgets/gunType_tile.dart';
import 'package:makebulletsbeta/widgets/update_tile.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<MainStore>(
     create: (_) => MainStore(),
     child: MaterialApp(
       title: "MakeBullets-Beta",
       home: Home(),
     ),
    );
  }
}

    



