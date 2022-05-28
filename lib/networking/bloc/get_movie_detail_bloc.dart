import 'dart:async';

import 'package:practical_test_adorebits/networking/models/get_movie_detail_model.dart';
import 'package:practical_test_adorebits/networking/models/get_movie_list_model.dart';
import 'package:practical_test_adorebits/networking/repository/repositories.dart';
import 'package:practical_test_adorebits/networking/response.dart';

class GetMovieDetailBloc {
  late GetMovieDetailRepository getMovieDetailRepository;
  late StreamController<Response<MovieDetailResponse>> getMovieDetailBlocController;

  StreamSink<Response<MovieDetailResponse>> get dataSink => getMovieDetailBlocController.sink;
  Stream<Response<MovieDetailResponse>>get dataStream =>getMovieDetailBlocController.stream;

  GetMovieDetailBloc(){
    getMovieDetailRepository = GetMovieDetailRepository();
    getMovieDetailBlocController = StreamController<Response<MovieDetailResponse>>();
  }

  getMovieDetail(id) async {
    dataSink.add(Response.loading("getting movie detail..."));
    try{
      MovieDetailResponse movieDetail = await getMovieDetailRepository.getMovieDetail(id);
      dataSink.add(Response.completed(movieDetail));
    }
    catch(e){
      dataSink.add(Response.error(e.toString()));
    }
    return null;
  }

  dispose(){
    getMovieDetailBlocController.close();
  }

}