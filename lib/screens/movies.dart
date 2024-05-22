import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_movie/model/movie/index.dart';
import 'package:flutter_movie/providers/common.dart';
import 'package:flutter_movie/widgets/movie_card.dart';
import 'package:flutter_movie/widgets/movie_special_card.dart';
import 'package:provider/provider.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  Future<List<MovieModel>> _getData() async {
    String res =
        await DefaultAssetBundle.of(context).loadString("assets/movies.json");
    List<MovieModel> data = MovieModel.fromList(jsonDecode(res));
    Provider.of<CommonProvider>(context, listen: false).setMovies(data);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getData(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          final _specialData = snapshot.data!.length > 3
              ? snapshot.data!.sublist(0, 3)
              : snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Шилдэг",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 10),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      _specialData.length,
                      ((index) => MovieSpecialCard(_specialData[index])),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Бүх кинонууд",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Wrap(
                    spacing: 20,
                    runSpacing: 10,
                    children: List.generate(
                      snapshot.data!.length,
                      (index) => MovieCard(snapshot.data![index]),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        } else {
          return const Center(
            child: SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(),
            ),
          );
        }
      }),
    );
  }
}
