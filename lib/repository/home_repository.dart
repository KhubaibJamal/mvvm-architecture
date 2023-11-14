import 'package:mvvm/model/movie_model.dart';
import 'package:mvvm/resources/app_url.dart';

import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';

class HomeRepository {
  BaseApiServices apiServices = NetworkApiServices();

  Future<MovieModel> getMovieList() async {
    try {
      dynamic response =
          await apiServices.getGetApiResponse(AppUrl.movieEndPoint);
      return response = MovieModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
