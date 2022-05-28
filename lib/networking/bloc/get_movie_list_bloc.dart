import 'dart:async';

import 'package:practical_test_adorebits/networking/models/get_movie_list_model.dart';
import 'package:practical_test_adorebits/networking/repository/repositories.dart';
import 'package:practical_test_adorebits/networking/response.dart';

class GetMovieListBloc {
  late GetMovieListRepository getMovieListRepository;
  late StreamController<Response<MovieList>> getMovieListBlocController;

  StreamSink<Response<MovieList>> get dataSink => getMovieListBlocController.sink;
  Stream<Response<MovieList>>get dataStream =>getMovieListBlocController.stream;

  GetMovieListBloc(){
    getMovieListRepository = GetMovieListRepository();
    getMovieListBlocController = StreamController<Response<MovieList>>();
  }

  getMovieList() async {
    dataSink.add(Response.loading("getting movie list..."));
    try{
      MovieList movieList = await getMovieListRepository.getMovieList();
      dataSink.add(Response.completed(movieList));
    }
    catch(e){
      dataSink.add(Response.error(e.toString()));
    }
    return null;
  }

  dispose(){
    getMovieListBlocController.close();
  }

}