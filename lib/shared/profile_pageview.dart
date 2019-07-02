import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:wedate/services/model.dart';
import 'package:dots_indicator/dots_indicator.dart';


class ProfileImgView extends StatefulWidget {

  final PageController _pageController = PageController(
    initialPage: 0,
  );
  @override
  _ProfileImgViewState createState() => _ProfileImgViewState();
}

class _ProfileImgViewState extends State<ProfileImgView>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  int currentIndex = 0;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PageView.builder(
        onPageChanged: (index){
          setState(() {
            currentIndex = index;
          });
        },
        itemCount: 3,
        controller: widget._pageController,
        pageSnapping: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.asset(
                persons[index].img1,
                fit: BoxFit.cover,
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(0.1, 0.0), // near the top right
                    radius: 1.0,
                    colors: [
                      const Color(0x000000),
                      const Color(0xff000000),
                    ],
                    stops: [0.4, 1.0],
                  ),
                ),
              ),
            ],
          );
        },
      ),
      Positioned(
              bottom: MediaQuery.of(context).size.height * 0.06,
              left: 20.0,
              right: 20.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Nombre: Jorge",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),
                  ),
                  DotsIndicator(
                    dotsCount: 3,
                    position: currentIndex,
                    decorator: DotsDecorator(
                      activeColor: Colors.redAccent,
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                  Text(
                    "Edad: 21",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),
                  )
                ],
              ),
            )
      ],
    );
  }
}