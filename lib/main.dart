import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:we_movies/layout/home_layout.dart';
import 'package:we_movies/modules/Login/Login_Layout.dart';
import 'package:we_movies/modules/Register/Profile_Data.dart';
import 'package:we_movies/modules/Register/Regiter_Layout.dart';
import 'package:we_movies/modules/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  runApp(const CineWorld());
}

class CineWorld extends StatelessWidget {
  const CineWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:'onBoardingSCreen' ,
      routes: {
        'home':(context) => HomePage(),
        'onBoardingSCreen':(context) => onBoardingSCreen(),
        'LoginPage':(context) => LoginPage(),
        'RegisterPage':(context) => RegisterPage(),
        'ProfileData':(context) => ProfileData()
      },
    );
  }
}