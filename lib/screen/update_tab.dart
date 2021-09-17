import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:makebulletsbeta/controller/main_store.dart';
import 'package:makebulletsbeta/widgets/update_tile.dart';
import 'package:provider/provider.dart';

class UpdateTab extends StatefulWidget {
  const UpdateTab({Key? key}) : super(key: key);

  @override
  _UpdateTabState createState() => _UpdateTabState();
}

class _UpdateTabState extends State<UpdateTab> {

  late MainStore mainStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mainStore = Provider.of<MainStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Observer(
        builder: (_) {
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
        },
      ),
    );
  }
}
