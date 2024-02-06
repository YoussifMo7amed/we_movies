import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_movies/model/UserModel.dart';
import 'package:we_movies/model/home_Upcoming_Model.dart';
import 'package:we_movies/modules/bloc/cubit.dart';
import 'package:we_movies/modules/bloc/states.dart';
import 'package:we_movies/shared/constants/constants.dart';
import 'package:we_movies/shared/styles/colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MovieCubit.get(context);
        cubit.getGenreNames(
            genres: genres, genreIds: cubit.trendingModel!.result[0].genres);
        return StreamBuilder(
          stream: cubit.reference.doc(cubit.uid).snapshots(),
          builder: (context, snapshot) {
            Message? message;
            if (snapshot.hasData && snapshot.data!.data() != null) {
              // Access data directly from the single document snapshot
              Map<String, dynamic> userInfo =
                  snapshot.data!.data()! as Map<String, dynamic>;

              // Create a Message object from the data
              message = Message.fromjson(userInfo);
            }

            return ConditionalBuilder(
              condition: snapshot.hasData &&
                  state is! MovieUpComingLoadingState &&
                  state is! MovieTrendingLoadingState,
              fallback: (context) => Center(child: CircularProgressIndicator()),
              builder: (context) => SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Top Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hello,",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  message!.name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                              ],
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      message!.image), // Placeholder image
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Best Upcoming Movies",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          height: 345,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                cubit.upComingModel!.result.length, // Placeholder for the number of movies
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(right: 26),
                                width: 250,
                                height: 400,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "http://image.tmdb.org/t/p/w500/${cubit.upComingModel!.result[index].backdropPath}"), // Placeholder image
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Trending Now",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ],
                        ),

                        SizedBox(height: 10),
                        Container(
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0)),
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                cubit.trendingModel!.result.length, // Placeholder for the number of trending movies
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Card(
                                  elevation: 0,
                                  color: defaultcolor2,
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Image.network(
                                          "http://image.tmdb.org/t/p/w500/${cubit.trendingModel!.result[index].backdropPath}",
                                          width: 125,
                                          height: 172,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      SizedBox(
                                        width: 125,
                                        height: 30,
                                        child: Text(
                                          "${cubit.trendingModel!.result[index].title}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 125,
                                        height: 50,
                                        child: Text(
                                          "${cubit.getGenreNames(genres: genres, genreIds: cubit.trendingModel!.result[index].genres).join(" , ")}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16.0,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
