import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_list/helper/filter_movie_provider.dart';
import 'package:movie_list/loading_page.dart';
import 'package:movie_list/view/movie_detail_page.dart';
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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoadingPage()),
              );
            },
            icon: Icon(Icons.refresh, size: 40),
          ),
        ],
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
              (context.read<FilterMovieProvider>().getTopMovieList.isEmpty)
                  ? Center(child: Text("No Movie Found!"))
                  : CarouselSlider.builder(
                    itemCount:
                        context
                            .watch<FilterMovieProvider>()
                            .getTopMovieList
                            .length,
                    itemBuilder: (ctx, index, _) {
                      final _topMovies =
                          context.watch<FilterMovieProvider>().getTopMovieList;
                      return InkWell(
                        onTap: () {
                          //navigate to movide details page..... here... [ top movie list]
                          context.read<FilterMovieProvider>().setMovieIdex(
                            index,
                          );
                          context.read<FilterMovieProvider>().setFlagOfMovie(
                            true,
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailPage(),
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    _topMovies[index].image!.medium.toString(),
                                  ),
                                  fit: BoxFit.cover,
                                  onError:
                                      (exception, stackTrace) =>
                                          Icon(Icons.image, size: 17),
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
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: 250,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      autoPlayInterval: const Duration(seconds: 5),
                    ),
                  ),

              Text("All Movie", style: TextStyle(fontSize: 22)),
              context.watch<FilterMovieProvider>().getAllMovieList.isEmpty
                  ? Center(child: Text("No Movie Found"))
                  : GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount:
                        context
                            .watch<FilterMovieProvider>()
                            .getAllMovieList
                            .length,
                    itemBuilder: (ctx, index) {
                      final movie =
                          context
                              .watch<FilterMovieProvider>()
                              .getAllMovieList[index];
                      return InkWell(
                        onTap: () {
                          //navigate to movide details page..... here... [ all movie list]
                          context.read<FilterMovieProvider>().setMovieIdex(
                            index,
                          );
                          context.read<FilterMovieProvider>().setFlagOfMovie(
                            false,
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailPage(),
                            ),
                          );
                        },
                        child: Padding(
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
                                    loadingBuilder: (
                                      _,
                                      child,
                                      loadingProgress,
                                    ) {
                                      if (loadingProgress == null) return child;
                                      return SizedBox(
                                        width: 17,
                                        height: 17,
                                        child: CircularProgressIndicator(),
                                      );
                                    },
                                    errorBuilder:
                                        (context, error, stackTrace) => Icon(
                                          Icons.broken_image,
                                          size: 17,
                                          color: Colors.grey,
                                        ),
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
                        ),
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
