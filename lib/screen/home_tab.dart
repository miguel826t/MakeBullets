import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:makebulletsbeta/controller/main_store.dart';
import 'package:makebulletsbeta/screen/gunType_tab.dart';
import 'package:makebulletsbeta/screen/update_tab.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
//Variaveis do programa********************************************************
  var _numberFormat =
      NumberFormat.simpleCurrency(decimalDigits: 0, name: "", locale: "pt_BR");
  PageController _pageController = PageController();
  int _pag = 0;
  late MainStore mainStore;
  bool _limitaClick = true;
  bool _animation = true;
  double _height = 300.0;
  double _width = 300.0;

//Metodo de inicio************************************************************
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mainStore = Provider.of<MainStore>(context);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

//*****************************************************************************
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 10, 5, 0),
                child: Observer(builder:(_) {
                  return Text(
                    _numberFormat.format(mainStore.dataBase.money),
                    style: TextStyle(color: Colors.black, fontSize: 22.0),
                  );
                }),
              ),
              Image.asset(
                'images/Bullet1-Back.png',
                fit: BoxFit.fill,
                height: 30,
                width: 30,
              ),
            ],
          ),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
//**
      bottomNavigationBar: SizedBox(
        height: 63,
        child: BottomNavigationBar(
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.white,
          backgroundColor: Colors.grey,
          currentIndex: _pag,
          onTap: (p) {
            _pageController.animateToPage(p,
                duration: Duration(milliseconds: 500), curve: Curves.easeIn);
          },
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("images/MainFactoryIcon.png"),size: 33,),
              label: "Fabrica",
            ),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("images/UpdateBullets.png"),size: 33,),
                label: "Updates"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("images/CartGun.png"),size: 33,),
                label: "Armas"),
          ],
        ),
      ),

      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (p) {
          setState(() {
            _pag = p;
          });
        },
        children: [
          MaterialButton(
            padding: EdgeInsets.all(0.0),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              setState(() {
                if (_animation) {
                  _animation = false;
                  _height = 320;
                  _width = 320;
                  mainStore.incrementMoney();
                } else {
                  _animation = true;
                  _height = 280.0;
                  _width = 280.0;
                  //   mainStore.incrementMoney();
                }
              });
            },
            child: Center(
              child: Image.asset(
                'images/MainFactory.png',
                height: _height,
                width: _width,
              ),
            ),
          ),
          Container(
            child: UpdateTab(),
          ),
          Container(child: GunTypeTab()),
        ],
      ),
    );
  }

//Metodos do App

}
