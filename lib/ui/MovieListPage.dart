// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:practical_test_adorebits/networking/bloc/get_movie_list_bloc.dart';
import 'package:practical_test_adorebits/networking/models/get_movie_list_model.dart';
import 'package:practical_test_adorebits/networking/response.dart';
import 'package:practical_test_adorebits/ui/MovieDetailPage.dart';
import 'package:practical_test_adorebits/utils/constants.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  late GetMovieListBloc getMovieListBloc;
  ValueNotifier<List<Result>> movieList = ValueNotifier([]);
  List<Result> allMovieList = [];

  @override
  void initState() {
    movieList.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    getMovieListBloc = GetMovieListBloc();
    getMovieListBloc.dataStream.listen((event) {
      setState(() {
        switch (event.status) {
          case Status.LOADING:
            break;
          case Status.COMPLETED:
            print(event.data!.results);
            movieList.value = event.data!.results!;
            allMovieList = movieList.value;
            break;
          case Status.ERROR:
            print(event.message);
            break;
          default:
        }
      });
    });
    getMovieListBloc.getMovieList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: secondaryColor,
          elevation: 0,
          title: const Text("Movie List"),
          centerTitle: true,
        ),
        body: allMovieList.isNotEmpty
            ? ListView.builder(
                itemCount: allMovieList.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDetailPage(
                                  allMovieList[index].title.toString(),
                                  allMovieList[index].id.toString())));
                    },
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.network(
                                imageBaseUrl +
                                    allMovieList[index].posterPath.toString(),
                                fit: BoxFit.contain,
                                height: 150,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                        allMovieList[index].title.toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3.0),
                                    child: Text(
                                        allMovieList[index]
                                            .releaseDate
                                            .toString()
                                            .substring(0, 11),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.0)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      allMovieList[index].overview.toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Colors.white,
                          thickness: 1.0,
                          indent: 10.0,
                        )
                      ],
                    ),
                  );
                })
            : const Center(
                child: CircularProgressIndicator(color: Colors.white)));
  }
}
