import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_list/helper/filter_movie_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Movie List",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(7),
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Top Rated", style: TextStyle(fontSize: 22)),
              FutureBuilder(
                future:
                    context.read<FilterMovieProvider>().initilizeTopRateMovie(),
                builder: (ctx, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: Center(child: Text('Error Occures')),
                    );
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('Failed to Load data'));
                  }

                  final _topMovies = snapshot.data!;
                  return CarouselSlider.builder(
                    itemCount: _topMovies.length,
                    itemBuilder: (ctx, index, _) {
                      return Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              image: DecorationImage(
                                image: NetworkImage(
                                  _topMovies[index].image!.medium.toString(),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Container(
                                color: Colors.black.withValues(alpha: 0.3),
                                child: Text(
                                  "${_topMovies[index].name.toString()} [IMDB: ${_topMovies[index].rating!.average.toString()}]",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    options: CarouselOptions(
                      height: 250,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      autoPlayInterval: const Duration(seconds: 5),
                    ),
                  );
                },
              ),

              Text("All Movie", style: TextStyle(fontSize: 22)),
              FutureBuilder(
                future: context.read<FilterMovieProvider>().initilizeMovie(),
                builder: (ctx, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: Center(child: Text('Error Occures')),
                    );
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('Failed to Load data'));
                  }

                  final _movies = snapshot.data!;
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _movies.length,
                    itemBuilder: (ctx, index) {
                      final movie = _movies[index];
                      return Padding(
                        padding: const EdgeInsets.all(3),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 2,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  movie.image!.medium.toString(),
                                  width: 90,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              // Movie Info
                              Text(
                                movie.name.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                movie.premiered.toString(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
