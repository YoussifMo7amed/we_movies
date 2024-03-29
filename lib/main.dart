// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_movies/layout/home_layout.dart';
import 'package:we_movies/modules/Login/Login_Layout.dart';
import 'package:we_movies/modules/Register/Profile_Data.dart';
import 'package:we_movies/modules/Register/Regiter_Layout.dart';
import 'package:we_movies/modules/bloc/cubit.dart';
import 'package:we_movies/modules/bloc/states.dart';
import 'package:we_movies/modules/screens/Movie%20details.dart';
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
  bool? onboarding = casheHealper.get(key: 'onBoarding');
  String? token = casheHealper.get(key: 'email');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  String widget;
  if(onboarding!=null)
{
if(token!=null)
{
  widget ="home";
}else {
  widget="LoginPage";
}
}
else{
  
  widget ="onBoardingSCreen";
}
  runApp( CineWorld(widget: widget,));
}

class CineWorld extends StatelessWidget {
   CineWorld({super.key, this.widget});
String? widget;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit(context)
        ..getUpComing()
        ..getTrending()
        ..getNewMovies()
        ..getPopularMovies(),
      child: BlocConsumer<MovieCubit,MovieStates>(
        listener: (context, state) {
          
        },
        builder:(context, state) {
          
          return  MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: widget,
          routes: {
            'home': (context) => const HomePage(),
            'onBoardingSCreen': (context) => const onBoardingSCreen(),
            'LoginPage': (context) => LoginPage(),
            'RegisterPage': (context) => RegisterPage(),
            'ProfileData': (context) => ProfileData(),
            'search': (context) => SearchPage(),
            'MovieDetails': (context) => const MovieDetails(),
          },
        );
        }, 
      ),
    );
  }
}
