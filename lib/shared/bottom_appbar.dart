import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBottomNav extends StatelessWidget {
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
       decoration: BoxDecoration(color: Color(0xFFEEEEEE)),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
        child:
          new Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (value) {
                final routes = ["/home", "/profiledata"];
                _currentIndex = value;
                Navigator.of(context).pushNamedAndRemoveUntil(
                    routes[value], (route) => false);
              },
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home,color: Colors.redAccent,),
                  title: Text('Home'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.heartBroken,color: Colors.redAccent,),
                  title: Text('Next'),
                ),
              ],)
          ]),
      ),
    );
  }
}