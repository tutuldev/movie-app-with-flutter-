import 'package:flutter/material.dart';
import 'package:movie_app/data/movies.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/screens/movie_details.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Movie> movieList = [];

  @override
  void initState() {
    super.initState();
    showMovies();
  }

  void showMovies() {
    List movies = MovieList.movies;
    setState(() {
      movieList = movies.map((movie) => Movie.fromJson(movie)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Movie List"),
      ),
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(movieList[index].title),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MovieDetails(movie:movieList[index]),));
              },
            ),
          );
        },
      ),
    );
  }
}
