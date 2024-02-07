// ignore_for_file: file_names, non_constant_identifier_names

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_movies/modules/bloc/cubit.dart';
import 'package:we_movies/modules/bloc/states.dart';
import 'package:we_movies/shared/styles/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {
      },
      builder: (context, state) {

        var cubit = MovieCubit.get(context);
        if(state is MovieCreditsSuccesState)
        {

        cubit.  controller=YoutubePlayerController(initialVideoId: cubit.gettrail()!,flags:const YoutubePlayerFlags(
            autoPlay: false,
            mute: false,
            enableCaption: false,
            loop: false,
          ) );
        }
        return YoutubePlayerBuilder(
          player: YoutubePlayer(controller:cubit. controller),
          builder:(Context, player) =>  ConditionalBuilder(
            condition: state is !MovieGetTrailLoadingstate,
            fallback: (context) => const Center(child: CircularProgressIndicator()),
            builder:(context) =>  Scaffold(
              body: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    color: defaultcolor2,
                  ),
                  Positioned(
                      top: 0,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            color: Colors.yellow,
                            height: 344,
                            width: 430,
                            child:player,
                            
                            /* Image.network(
                              height: 200,
                              width: 100,
                              "http://image.tmdb.org/t/p/w500/${cubit.detailsMoviesModel!.backdropPath}",
                              fit: BoxFit.fill,
                            ),*/
                          ),
                         /* Icon(
                            Icons.play_circle_fill_outlined,
                            size: 100,
                            color: Colors.white60,
                          )*/
                        ],
                      )),
                  Positioned(
                    bottom: 0,
                    left: 1,
                    right: 1,
                    child: Container(
                      width: 600,
                      height: 580,
                      decoration: BoxDecoration(
                          color: defaultcolor2,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.network(
                                  "http://image.tmdb.org/t/p/w500/${cubit.detailsMoviesModel!.posterPath}",
                                  width: 180,
                                  height: 250,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 200,
                                  
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      "${cubit.detailsMoviesModel!.originalTitle}",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      cubit.genreNames.join(" , "),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      "${cubit.detailsMoviesModel!.overview}",
                                      maxLines: 7,
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Text(
                                "4.7",
                                style:
                                    TextStyle(fontSize: 16.0, color: Colors.white),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Icon(Icons.watch_later_rounded, color: Colors.white),
                              SizedBox(width: 5),
                              Text(
                                "2 h 14 min",
                                style:
                                    TextStyle(fontSize: 16.0, color: Colors.white),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text(
                              "Cast",
                              style: TextStyle(fontSize: 26.0, color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 150,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 40,
                                        backgroundImage: NetworkImage(
                                          "http://image.tmdb.org/t/p/w500/${cubit.creditModel!.cast[index].profilePath}"
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      SizedBox(
                                        width: 50,
                                        child: Text(
                                          "${cubit.creditModel!.cast[index].name}",
                                          maxLines: 2,
                                          style: const TextStyle(
                                              fontSize: 16, color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                onPressed: () {
                                  // Action when Watch Now is pressed
                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    fixedSize: const Size(350, 20)),
                                child: const Text(
                                  'Watch Now',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
