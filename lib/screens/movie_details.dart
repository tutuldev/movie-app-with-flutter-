import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:carousel_slider/carousel_slider.dart';


class MovieDetails extends StatelessWidget {
  final Movie movie;

  const MovieDetails({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(movie.title),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            child: CarouselSlider(items: movie.images.map((image) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: ClipRRect(

                borderRadius: BorderRadius.circular(20),
                child: Image.network(image,fit: BoxFit.cover,),
              ),
            ) ).toList(), options: CarouselOptions(
              autoPlay: true,
              initialPage: 1,
              viewportFraction: 0.8,
              enlargeCenterPage: true,
            )),
          ),
          Text(movie.director, style: const TextStyle(fontSize: 24),),
        ],
      ),
    );
  }
}
