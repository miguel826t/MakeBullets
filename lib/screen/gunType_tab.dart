import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:makebulletsbeta/controller/main_store.dart';
import 'package:makebulletsbeta/widgets/gunType_tile.dart';
import 'package:provider/provider.dart';

class GunTypeTab extends StatefulWidget {
  const GunTypeTab({Key? key}) : super(key: key);

  @override
  _GunTypeTabState createState() => _GunTypeTabState();
}

class _GunTypeTabState extends State<GunTypeTab>
    with AutomaticKeepAliveClientMixin {

  late MainStore mainStore;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mainStore = Provider.of<MainStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container(
      child: Observer(
          builder: (_) {
            return ListView.builder(
                itemCount: mainStore.dataBase.gunType.length,
                itemBuilder: (context, index) {
                  return GunTypeTile(mainStore.dataBase.gunType[index]);
                }
            );
          }
      ),
    );
  }


  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
