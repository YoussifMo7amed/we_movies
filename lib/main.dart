import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_movies/layout/home_layout.dart';
import 'package:we_movies/modules/Login/Login_Layout.dart';
import 'package:we_movies/modules/Register/Profile_Data.dart';
import 'package:we_movies/modules/Register/Regiter_Layout.dart';
import 'package:we_movies/modules/bloc/cubit.dart';
import 'package:we_movies/modules/screens/search.dart';
import 'package:we_movies/modules/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:we_movies/shared/constants/Bloc_Observer.dart';
import 'package:we_movies/shared/network/local/cache.dart';
import 'package:we_movies/shared/network/remote/dio_helpear.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await casheHealper.init();

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
    return BlocProvider(
      create: (context) => MovieCubit(context)..getUpComing()..getTrending()..getNewMovies()..getPopularMovies(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'onBoardingSCreen',
        routes: {
          'home': (context) => HomePage(),
          'onBoardingSCreen': (context) => onBoardingSCreen(),
          'LoginPage': (context) => LoginPage(),
          'RegisterPage': (context) => RegisterPage(),
          'ProfileData': (context) => ProfileData(),
          'search':(context) => Search(),
        },
      ),
    );
  }
}
