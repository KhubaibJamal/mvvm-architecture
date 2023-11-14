import 'package:flutter/material.dart';
import 'package:mvvm/data/response/api_response.dart';
import 'package:mvvm/model/movie_model.dart';
import 'package:mvvm/repository/home_repository.dart';

class HomeViewModel with ChangeNotifier {
  final _homeRepository = HomeRepository();

  ApiResponse<MovieModel> movieList = ApiResponse.loading();

  setMovieList(ApiResponse<MovieModel> response) {
    movieList = response;
    notifyListeners();
  }

  Future<void> getMovieListApi() async {
    setMovieList(ApiResponse.loading());

    _homeRepository.getMovieList().then((value) {
      setMovieList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMovieList(ApiResponse.error(error.toString()));
    });
  }
}
