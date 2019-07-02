import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wedate/shared/shared.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _heightFactorAnimation;
  Animation<double> _heightFontAnimation;
  double collapseHeightFactor = 0.90;
  double expandedHeightFactor = 0.70;
  bool isAnimationCompleted = false;
  double screenHeight = 0;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _heightFactorAnimation =
        Tween<double>(begin: collapseHeightFactor, end: expandedHeightFactor)
            .animate(_controller);
    _heightFontAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  onBottomPartTap() {
    if (isAnimationCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    isAnimationCompleted = !isAnimationCompleted;
  }

  _handleVerticalUpdate(DragUpdateDetails updateDetails) {
    double fractionDragged = updateDetails.primaryDelta / screenHeight;
    //print(fractionDragged);
    _controller.value = _controller.value - 5 * fractionDragged;
  }

  _handleVerticalEnd(DragEndDetails endDetails) {
    if (_controller.value >= 0.5) {
      _controller.fling(velocity: 1);
    } else {
      _controller.fling(velocity: -1);
    }
  }

  Widget getWidget() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        FractionallySizedBox(
          alignment: Alignment.topCenter,
          heightFactor: _heightFactorAnimation.value,
          child:
              ProfileImgView(), //Image.asset("assets/img1jorge.jpg",fit: BoxFit.cover),//colorBlendMode: BlendMode.hue,color: Colors.black,
        ),
        GestureDetector(
          onVerticalDragUpdate: _handleVerticalUpdate,
          onVerticalDragEnd: _handleVerticalEnd,
          onTap: () {
            onBottomPartTap();
          },
          child: FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 1.06 - _heightFactorAnimation.value,
            child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0)),
                ),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.maximize,
                      size: 30.0,
                      color: Colors.grey,
                    ),
                    Flexible(
                      child: Text(
                        "Hola soy Jorge, un estudiante que le dedica horas a Internet y a sus millones de posibilidades, para mi esto es un hobby como para otros es jugar a futbol prueba prueba prueba prueba prueba prueba prueba prueba prueba prueba prueba prueba",
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.normal,
                          fontSize: 15.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, widget) {
          return getWidget();
        },
      ),
      floatingActionButton: DiamondButton(),
      bottomNavigationBar: AppBottomNav(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
