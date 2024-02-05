import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_movies/model/UserModel.dart';
import 'package:we_movies/modules/bloc/cubit.dart';
import 'package:we_movies/modules/bloc/states.dart';
import 'package:we_movies/shared/styles/colors.dart';
  final GlobalKey<ScaffoldState> Scaffoldkey = GlobalKey<ScaffoldState>();

class HomePage extends StatelessWidget {

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
                BorderRadiusDirectional.vertical(top: Radius.circular(20.0)),
            child: BottomNavigationBar(
              backgroundColor: Color(0xff2E3350),
              elevation: 1.0,
        currentIndex: cubit.currentIndex,
        onTap:(Index) {
         cubit.changeIndex(Index); 
        } ,
        
              items: [
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
