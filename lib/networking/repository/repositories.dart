import 'package:practical_test_adorebits/networking/apiprovider.dart';
import 'package:practical_test_adorebits/networking/models/get_movie_detail_model.dart';
import 'package:practical_test_adorebits/networking/models/get_movie_list_model.dart';
import 'package:practical_test_adorebits/utils/constants.dart';

class GetMovieListRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<MovieList> getMovieList() async {
    final response = await _apiProvider.get(baseUrl+"/discover/movie?" + apiKey + "&page=1");
    return MovieList.fromJson(response);
  }
}

class GetMovieDetailRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<MovieDetailResponse> getMovieDetail(id) async {
    final response = await _apiProvider.get(baseUrl +"/movie/" + id+"?" +apiKey);
    return MovieDetailResponse.fromJson(response);
  }
}
