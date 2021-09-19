import 'package:flutter/material.dart';
import 'package:makebulletsbeta/controller/main_store.dart';
import 'package:provider/provider.dart';

class MainFactory extends StatefulWidget {
  static const TWO_PI = 3.14 * 2;

  @override
  _MainFactoryState createState() => _MainFactoryState();
}

class _MainFactoryState extends State<MainFactory>
    with AutomaticKeepAliveClientMixin {
  double _size = 90.0;
  double _imgSize = 300;
  double _end = 0.00;
  bool _click = true;

  @override
  Widget build(BuildContext context) {
    MainStore mainStore = Provider.of<MainStore>(context);
    return Center(
        child: TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: _end),
            duration: Duration(milliseconds: 500),
            builder: (context, double value, child) {
              return Container(
                width: _imgSize,
                height: _imgSize,
                child: MaterialButton(
                  padding: EdgeInsets.all(0.0),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      _size = _size == 80 ? 90 : 80;
                      _imgSize = _imgSize == 280 ? 300 : 280;
                      if (_click == true) {
                        _click = false;
                        Future.delayed(Duration(milliseconds: 100), () {
                          _end = _end <= 1.0 ? _end += 0.01 : _end = 0.00;
                          if (_end == 0.0) {
                            mainStore.incrementGoldBullet();
                          }
                          mainStore.incrementMoney();
                          _click = true;
                        });
                      }
                    });
                  },
                  child: Stack(
                    children: [
                      Image.asset(
                        'images/MainFactory.png',
                        height: _imgSize,
                        width: _imgSize,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(110, 100, 0, 0),
                        child: Center(
                          child: Container(
                            width: _size,
                            height: _size,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.grey),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(110, 100, 0, 0),
                        child: Center(
                          child: ShaderMask(
                            shaderCallback: (rect) {
                              return SweepGradient(
                                  startAngle: 0.0,
                                  stops: [value, value],
                                  endAngle: MainFactory.TWO_PI,
                                  center: Alignment.center,
                                  colors: [
                                    Colors.yellow,
                                    Colors.grey.withAlpha(55)
                                  ]).createShader(rect);
                            },
                            child: Container(
                              width: _size,
                              height: _size,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(110, 100, 0, 0),
                        child: Center(
                          child: Image.asset(
                            'images/MainBullet.png',
                            height: _size - 30,
                            width: _size - 30,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }));
  }

  @override
  bool get wantKeepAlive => true;
}
