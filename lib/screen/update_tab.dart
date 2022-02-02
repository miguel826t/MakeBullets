import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:makebulletsbeta/controller/main_store.dart';
import 'package:makebulletsbeta/widgets/updateGold_tile.dart';
import 'package:makebulletsbeta/widgets/update_tile.dart';
import 'package:provider/provider.dart';

class UpdateTab extends StatefulWidget {
  const UpdateTab({Key? key}) : super(key: key);

  @override
  _UpdateTabState createState() => _UpdateTabState();
}

class _UpdateTabState extends State<UpdateTab>
    with SingleTickerProviderStateMixin {
  late MainStore mainStore;
  var _scrollController, _tabController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mainStore = Provider.of<MainStore>(context);
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 50,
              backgroundColor: Colors.white,
              floating: true,
              pinned: true,
              snap: false,
              //forceElevated: innerBoxIsScrolled,
              bottom: TabBar(
                tabs: <Tab>[
                  Tab(
                     // text: "Melhorias",
                      icon: Image.asset("images/Bullet1-Back.png",height: 20,width: 20,)
                     // ImageIcon(AssetImage("images/Bullet1-Back.png"),color: Colors.black,size: 20,),
                  ),
                  Tab(
                      //text: "Melhorias de ouro",
                    icon: Image.asset("images/MainBullet.png",height: 20,width: 20,)
                   // ImageIcon(AssetImage("images/MainBullet.png"),color: Colors.amber,size: 20,),

                  ),

                ],
                controller: _tabController,
              ),
            ),
          ];
        },
        body: Observer(builder: (_) {
          return TabBarView(
            controller: _tabController,
            children: [
              _pagePerk(mainStore),
             // _pageGoldPerk(),
              _pageGoldPerk(mainStore),
            ],
          );
        }),
      ),
    );
  }
}

_pagePerk(MainStore mainStore){
  return Column(
    children: [
      Expanded(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return UpdateTile(
                  mainStore.perks[index]);
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 2,
              );
            },
            itemCount: mainStore.perks.length),
      )
    ],
  );
}

_pageGoldPerk(MainStore mainStore){
  return Column(
    children: [
      Expanded(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return UpdateGoldTile(
                  mainStore.dataBase.goldPerks[index]);
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 2,
              );
            },
            itemCount: mainStore.dataBase.goldPerks.length),
      )
    ],
  );
}