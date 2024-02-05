abstract class MovieStates{}

class MovieInitialState extends MovieStates{}

class ChangeMovieButtomnavbarState extends MovieStates{}

class MovieRegisterLoadingState extends MovieStates{}

class MovieRegisterSuccesState extends MovieStates{}

class MovieRegisterErrorState extends MovieStates{
   final String error;

  MovieRegisterErrorState(this.error);

}

class MovieLoginLoadingState extends MovieStates{}

class MovieLoginSuccesState extends MovieStates{}

class MovieLoginErrorState extends MovieStates{
   final String error;

  MovieLoginErrorState(this.error);

}
class MovieAddUserLoadingState extends MovieStates{}

class MovieAddUserSuccesState extends MovieStates{}

class MovieAddUserErrorState extends MovieStates{
   final String error;

  MovieAddUserErrorState(this.error);

}
class MovieUpComingLoadingState extends MovieStates{}

class MovieUpComingSuccesState extends MovieStates{}

class MovieUpComingErrorState extends MovieStates{
   final String error;

  MovieUpComingErrorState(this.error);

}
class MoviePopularLoadingState extends MovieStates{}

class MoviePopularSuccesState extends MovieStates{}

class MoviePopularErrorState extends MovieStates{
   final String error;

  MoviePopularErrorState(this.error);

}

class MovieTrendingLoadingState extends MovieStates{}

class MovieTrendingSuccesState extends MovieStates{}

class MovieTrendingErrorState extends MovieStates{
   final String error;

  MovieTrendingErrorState(this.error);

}
class MovieNewMoviesLoadingState extends MovieStates{}

class MovieNewMoviesSuccesState extends MovieStates{}

class MovieNewMoviesErrorState extends MovieStates{
   final String error;

  MovieNewMoviesErrorState(this.error);

}
class MovieLoginchangepasswordState extends MovieStates{}

class MovieUpdateUserLoadingState extends MovieStates{}

class MovieUpdateUserSuccesState extends MovieStates{}

class MovieUpdateUserErrorState extends MovieStates{
   final String error;

  MovieUpdateUserErrorState(this.error);

}

class MovieDetailsLoadingState extends MovieStates{}

class MovieDetailsSuccesState extends MovieStates{}

class MovieDetailsErrorState extends MovieStates{
   final String error;

  MovieDetailsErrorState(this.error);

}