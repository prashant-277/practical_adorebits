// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:practical_test_adorebits/networking/bloc/get_movie_detail_bloc.dart';
import 'package:practical_test_adorebits/networking/models/get_movie_detail_model.dart';
import 'package:practical_test_adorebits/networking/response.dart';
import 'package:practical_test_adorebits/utils/constants.dart';

class MovieDetailPage extends StatefulWidget {
  var title;
  var id;

  MovieDetailPage(this.title, this.id, {Key? key}) : super(key: key);

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  late GetMovieDetailBloc getMovieDetailBloc;
  ValueNotifier<List<Genre>> GenresList = ValueNotifier([]);
  List<Genre> allGenresList = [];

  MovieDetailResponse? movieDetail;

  void initState() {
    getMovieDetailBloc = GetMovieDetailBloc();
    getMovieDetailBloc.dataStream.listen((event) {
      setState(() {
        switch (event.status) {
          case Status.LOADING:
            break;
          case Status.COMPLETED:
            print(event.data);
            movieDetail = event.data;
            GenresList.value = event.data!.genres!;
            allGenresList = GenresList.value;

            break;
          case Status.ERROR:
            print(event.message);
            break;
          default:
        }
      });
    });
    getMovieDetailBloc.getMovieDetail(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        elevation: 0,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: movieDetail != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(imageBaseUrl + movieDetail!.backdropPath,
                    width: MediaQuery.of(context).size.width, fit: BoxFit.fill),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text("Overview",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(movieDetail!.overview,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15.0)),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text("Genres",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(movieDetail!.genres.length.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15.0)),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text("Duration",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(movieDetail!.runtime.toString() + " Minutes",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15.0)),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text("Release Date",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                          movieDetail!.releaseDate.toString().substring(0, 10),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15.0)),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text("Production Companies",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                          movieDetail!.productionCompanies.length.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15.0)),
                    ),
                  ],
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator(color: Colors.white)),
    );
  }
}
