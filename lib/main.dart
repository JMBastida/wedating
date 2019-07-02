import 'package:flutter/material.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'screens/screens.dart';
import 'services/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
      providers: [
        //SStreamProvider<Report>.value(stream: Global.reportRef.documentStream),
        StreamProvider<FirebaseUser>.value(value: AuthService().user),
      ],
      child: MaterialApp(
        // Firebase Analytics
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
        ],
        // Named Routes
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen3(),
          '/home': (context) => HomeScreen(),
          '/profile': (context) => ProfileScreen(),
          '/profiledata': (context) => ProfileData(),
        },

        // Theme
        theme: ThemeData(
          primarySwatch: Colors.red,
          fontFamily: 'raleway'
        ),
      ),
    );
  }
}

