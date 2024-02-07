// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_movies/modules/bloc/cubit.dart';
import 'package:we_movies/modules/bloc/states.dart';
import 'package:we_movies/shared/styles/colors.dart';
  final GlobalKey<ScaffoldState> Scaffoldkey = GlobalKey<ScaffoldState>();

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit,MovieStates>(
      listener: (context, state) {
        
      },
    builder: (context, state) {
      var cubit=MovieCubit.get(context);
    return  Scaffold(
      key: Scaffoldkey,
          backgroundColor: defaultcolor2,
          body:cubit.bottomscreens[cubit.currentIndex],
          bottomNavigationBar: ClipRRect(
            borderRadius:
                const BorderRadiusDirectional.vertical(top: Radius.circular(20.0)),
            child: BottomNavigationBar(
              backgroundColor: const Color(0xff2E3350),
              elevation: 1.0,
        currentIndex: cubit.currentIndex,
        onTap:(Index) {
         cubit.changeIndex(Index); 
        } ,
        
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        );
       
    },      );
  }
}
