// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_movies/modules/bloc/cubit.dart';
import 'package:we_movies/modules/bloc/states.dart';
import 'package:we_movies/shared/components/component.dart';
import 'package:we_movies/shared/constants/constants.dart';
import 'package:we_movies/shared/styles/colors.dart';

class SearchPage extends StatelessWidget {
  var Formkey = GlobalKey<FormState>();
  var textcontroler = TextEditingController();
  String? thechecker;

  SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {
        if (state is MovieCreditsSuccesState) {
          Navigator.pushNamed(context, "MovieDetails");
        }
      },
      builder: (context, state) {
        var cubit = MovieCubit.get(context);
        return SafeArea(
          child: SingleChildScrollView(
            physics: state is MovieSearchSuccesState
                ? const NeverScrollableScrollPhysics()
                : const BouncingScrollPhysics(),
            child: Form(
              key: Formkey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    dfaultFormField(
                      textStyle: const TextStyle(color: Colors.grey, fontSize: 24.0),
                      controller: textcontroler,
                      type: TextInputType.text,
                      label: 'Search movie',
                      prefix: const Icon(
                        Icons.search,
                        color: Colors.white54,
                        size: 36.0,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Text';
                        }
                        return null;
                      },
                      onsubmit: (String text) {
                        if (text.isNotEmpty) {
                          cubit.getSearch(query: text);
                          thechecker = text;
                          textcontroler.clear();
                        }
                      },
                    ),
                    ConditionalBuilder(
                      condition: state is! MovieSearchLoadingState,
                      builder: (context) => ConditionalBuilder(
                        condition: state is! MovieSearchSuccesState &&
                                thechecker == null ||
                            state is ChangeMovieButtomnavbarState,
                        builder: (context) {
                          return Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "New Movie",
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
                              const SizedBox(height: 10),
                              Container(
                                height: 278,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: cubit.newMoviesModel!.result
                                      .length, // Placeholder for the number of trending movies
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          cubit.getDetailsMovies(
                                              movie_id: cubit.newMoviesModel!
                                                  .result[index].id!);
                                          cubit.getCreditMovies(
                                              movie_id: cubit.newMoviesModel!
                                                  .result[index].id!);
                                          cubit.getVideo(
                                              movie_id: cubit.newMoviesModel!
                                                  .result[index].id!);
                                        },
                                        child: Card(
                                          elevation: 0,
                                          color: defaultcolor2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                child: Image.network(
                                                  "http://image.tmdb.org/t/p/w500/${cubit.newMoviesModel!.result[index].backdropPath}",
                                                  width: 150,
                                                  height: 225,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              SizedBox(
                                                width: 125,
                                                height: 20,
                                                child: Text(
                                                  "${cubit.newMoviesModel!.result[index].title}",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 125,
                                                height: 20,
                                                child: Text(
                                                  cubit.getGenreNames(genres: genres, genreIds: cubit.newMoviesModel!.result[index].genres).join(" , "),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 16.0,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Most Popular",
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
                              const SizedBox(height: 10),
                              Container(
                                height: 350,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: cubit.popularMoviesModel!.result
                                      .length, // Placeholder for the number of trending movies
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          cubit.getDetailsMovies(
                                              movie_id: cubit
                                                  .popularMoviesModel!
                                                  .result[index]
                                                  .id!);
                                          cubit.getCreditMovies(
                                              movie_id: cubit
                                                  .popularMoviesModel!
                                                  .result[index]
                                                  .id!);
                                          cubit.getVideo(
                                              movie_id: cubit
                                                  .popularMoviesModel!
                                                  .result[index]
                                                  .id!);
                                        },
                                        child: Card(
                                          elevation: 0,
                                          color: defaultcolor2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                child: Image.network(
                                                  "http://image.tmdb.org/t/p/w500/${cubit.popularMoviesModel!.result[index].backdropPath}",
                                                  width: 150,
                                                  height: 228,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              SizedBox(
                                                width: 125,
                                                height: 20,
                                                child: Text(
                                                  "${cubit.popularMoviesModel!.result[index].title}",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 125,
                                                height: 70,
                                                child: Text(
                                                  cubit.getGenreNames(genres: genres, genreIds: cubit.popularMoviesModel!.result[index].genres).join(" , "),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 16.0,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                        fallback: (context) {
                          return Column(
                            children: [
                              const SizedBox(height: 10),
                              Container(
                                height: 1000,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount: cubit.searchMoviesModel!.result
                                      .length, // Placeholder for the number of trending movies
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          cubit.getDetailsMovies(
                                              movie_id: cubit.searchMoviesModel!
                                                  .result[index].id!);
                                          cubit.getCreditMovies(
                                              movie_id: cubit.searchMoviesModel!
                                                  .result[index].id!);
                                          cubit.getVideo(
                                              movie_id: cubit.searchMoviesModel!
                                                  .result[index].id!);
                                        },
                                        child: Card(
                                          elevation: 0,
                                          color: defaultcolor2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  child: cubit
                                                              .searchMoviesModel!
                                                              .result[index]
                                                              .backdropPath !=
                                                          null
                                                      ? Image.network(
                                                          "http://image.tmdb.org/t/p/w500/${cubit.searchMoviesModel!.result[index].backdropPath}",
                                                          width:
                                                              double.infinity,
                                                          height: 228,
                                                          fit: BoxFit.cover,
                                                        )
                                                      : const Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        )),
                                              const SizedBox(height: 4),
                                              SizedBox(
                                                width: double.infinity,
                                                height: 20,
                                                child: Text(
                                                  "${cubit.searchMoviesModel!.result[index].title}",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                              ),
                                              SizedBox(
                                                width: double.infinity,
                                                height: 70,
                                                child: Text(
                                                  cubit.getGenreNames(genres: genres, genreIds: cubit.searchMoviesModel!.result[index].genres).join(" , "),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 16.0,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          );
                        },
                      ),
                      fallback: (context) {
                        return const LinearProgressIndicator();
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
