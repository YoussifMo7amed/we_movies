// ignore_for_file: null_check_always_fails, unnecessary_null_comparison, unnecessary_nullable_for_final_variable_declarations, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:we_movies/model/DetailsModel.dart';
import 'package:we_movies/model/SearchModel.dart';
import 'package:we_movies/model/creditModel.dart';
import 'package:we_movies/model/home_Trending_Model.dart';
import 'package:we_movies/model/home_Upcoming_Model.dart';
import 'package:we_movies/model/movievideoModel.dart';
import 'package:we_movies/model/newmoviesModel.dart';
import 'package:we_movies/model/popularmoviesModel.dart';
import 'package:we_movies/modules/bloc/states.dart';
import 'package:we_movies/modules/screens/home.dart';
import 'package:we_movies/modules/screens/profile.dart';
import 'package:we_movies/modules/screens/search.dart';
import 'package:we_movies/shared/components/component.dart';
import 'package:we_movies/shared/constants/constants.dart';
import 'package:we_movies/shared/network/endpoints.dart';
import 'package:we_movies/shared/network/remote/dio_helpear.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieCubit extends Cubit<MovieStates> {
  MovieCubit(this.context) : super(MovieInitialState());
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  static MovieCubit get(context) => BlocProvider.of(context);
  CollectionReference reference =
      FirebaseFirestore.instance.collection('UserProfile');
  //User userInfo = FirebaseAuth.instance.currentUser!;
  List genreNames = [];
  UpComingModel? upComingModel;
  TrendingModel? trendingModel;
  NewMoviesModel? newMoviesModel;
  PopularMoviesModel? popularMoviesModel;
  DetailsMoviesModel? detailsMoviesModel;
  SearchMoviesModel? searchMoviesModel;
  CreditModel? creditModel;
  VideoModel? videoModel;
  late YoutubePlayerController controller;

  List<Widget> bottomscreens = [
    const Home(),
    SearchPage(),
    Profile(),
  ];
  int currentIndex = 0;
  final BuildContext context;

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeMovieButtomnavbarState());
  }

  Future<void> createUserWithEmailAndPassword(
      {required String emailAddress, required String password}) async {
    emit(MovieRegisterLoadingState());
    try {

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showToast(
            msg: 'The password provided is too weak.',
            state: ToastState.Warning);
        //Showmessage(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showToast(
            msg: 'The account already exists for that email.',
            state: ToastState.Warning);

        // Showmessage(context, 'The account already exists for that email.');
      }
    } catch (e) {
      showToast(msg: e.toString(), state: ToastState.Error);
      emit(MovieRegisterErrorState(e.toString()));
    }
  }

  Future<void> siginUserWithEmailAndPassword(
      {required String emailAddress, required String password}) async {
    emit(MovieLoginLoadingState());

    try {
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showToast(
            msg: 'No user found for that email.', state: ToastState.Warning);
        // Showmessage(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showToast(
            msg: 'Wrong password provided for that user.',
            state: ToastState.Warning);

        //Showmessage(context, 'Wrong password provided for that user.');
      }
      showToast(msg: e.toString(), state: ToastState.Error);

      emit(MovieLoginErrorState(e.toString()));
    }
  }

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      return;
    }
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> addUser({
    required String name,
    required String phoneNumber,
    required String dateOfBirth,
    required String country,
    required String imageUrl,
  }) {
    emit(MovieAddUserLoadingState());
    Map<String, dynamic> dataToSend = {
      'name': name,
      'phone': phoneNumber,
      'date': dateOfBirth,
      'country': country,
      'image': imageUrl,
    };
      final String? uid = FirebaseAuth.instance.currentUser!.email;

    return reference.doc(uid).set(dataToSend).then((value) {
      emit(MovieAddUserSuccesState());
    }).catchError((error) {
      showToast(msg: error.toString(), state: ToastState.Error);
      emit(MovieAddUserErrorState(error));
    });
  }

  Future<void> UpdateUser({
    required String name,
    required String phoneNumber,
    required String dateOfBirth,
    required String country,
    String? imageUrl,
  }) {
    emit(MovieUpdateUserLoadingState());
    Map<String, dynamic> dataToUpdate = {
      'name': name,
      'phone': phoneNumber,
    };
      final String? uid = FirebaseAuth.instance.currentUser!.email;

    return reference.doc(uid).update(dataToUpdate).then((value) {
      emit(MovieUpdateUserSuccesState());
    }).catchError((error) {
      showToast(msg: error.toString(), state: ToastState.Error);
      emit(MovieUpdateUserErrorState(error));
    });
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  IconData suffix = Icons.visibility_outlined;
  IconData suffix1 = Icons.visibility_outlined;

  bool ispassword1 = true;
  bool ispassword2 = true;

  void changepassword() {
    ispassword1 = !ispassword1;
    suffix1 =
        ispassword1 ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(MovieLoginchangepasswordState());
  }

  void changepassword1() {
    ispassword2 = !ispassword2;
    suffix =
        ispassword2 ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(MovieLoginchangepasswordState());
  }

  void getUpComing() {
    emit(MovieUpComingLoadingState());
    DioHelper.getData(
      url: UpComing,
    ).then((value) {
      upComingModel = UpComingModel.fromjson(value.data);

      emit(MovieUpComingSuccesState());
    }).catchError((error) {
      emit(MovieUpComingErrorState(error));
    });
  }

  void getTrending() {
    emit(MovieTrendingLoadingState());
    DioHelper.getData(
      url: Trending,
    ).then((value) {
      trendingModel = TrendingModel.fromjson(value.data);

      emit(MovieTrendingSuccesState());
    }).catchError((error) {
      emit(MovieTrendingErrorState(error));
    });
  }

  void getNewMovies() {
    emit(MovieNewMoviesLoadingState());
    DioHelper.getData(
      url: NewMovies,
    ).then((value) {
      newMoviesModel = NewMoviesModel.fromjson(value.data);

      emit(MovieNewMoviesSuccesState());
    }).catchError((error) {
      emit(MovieNewMoviesErrorState(error));
    });
  }

  void getPopularMovies() {
    emit(MoviePopularLoadingState());
    DioHelper.getData(
      url: Popular,
    ).then((value) {
      popularMoviesModel = PopularMoviesModel.fromjson(value.data);

      emit(MoviePopularSuccesState());
    }).catchError((error) {
      emit(MoviePopularErrorState(error));
    });
  }

  void getDetailsMovies({required int movie_id}) {
    emit(MovieDetailsLoadingState());
    DioHelper.getData(
      url: 'movie/$movie_id?api_key=$api_key&page=1',
    ).then((value) {
      detailsMoviesModel = DetailsMoviesModel.fromjson(value.data);
      for (var element in detailsMoviesModel!.genres) {
        genreNames.add(element.name);
      }

      emit(MovieDetailsSuccesState());
    }).catchError((error) {
      emit(MovieDetailsErrorState(error));
    });
  }

  void getCreditMovies({required int movie_id}) {
    emit(MovieCreditsLoadingState());
    DioHelper.getData(
      url: 'movie/$movie_id/credits?api_key=$api_key',
    ).then((value) {
      creditModel = CreditModel.fromjson(value.data);

      emit(MovieCreditsSuccesState());
    }).catchError((error) {
      emit(MovieCreditsErrorState(error));
    });
  }

  void getVideo({required int movie_id}) {
    emit(MovieVideoLoadingState());
    DioHelper.getData(
      url: 'movie/$movie_id/videos?api_key=$api_key',
    ).then((value) {
      videoModel = VideoModel.fromjson(value.data);

      emit(MovieVideoSuccesState());
    }).catchError((error) {
      emit(MovieVideoErrorState(error));
    });
  }

  List<String> getGenreNames(
      {required List<Map<String, dynamic>> genres,
      required List<dynamic> genreIds}) {
    List<String> genreNames = [];

    for (int id in genreIds) {
      Map<String, dynamic>? genre = genres.firstWhere(
        (element) => element['id'] == id,
        orElse: () {
          return null!;
        },
      );

      if (genre != null) {
        genreNames.add(genre['name']);
      }
    }

    return genreNames;
  }

  void getSearch({required String query}) {
    emit(MovieSearchLoadingState());
    DioHelper.getData(url: Search, query: {
      'query': query,
    }).then((value) {
      searchMoviesModel = SearchMoviesModel.fromjson(value.data);

      emit(MovieSearchSuccesState());
    }).catchError((error) {
      emit(MovieSearchErrorState(error));
    });
  }

  String? gettrail() {
        emit(MovieGetTrailLoadingstate());

    String? id;
    for (var element in videoModel!.result) {
      if (element.name!.contains("Trailer")) {
        id = element.key;
      }
    }
            emit(MovieGetTrailSucessstate());

    return id;
  }
}
