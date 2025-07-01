import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:movie_list/helper/filter_movie_provider.dart';
import 'package:movie_list/helper/url_launcher.dart';
import 'package:movie_list/widgets/greeen_button.dart';
import 'package:provider/provider.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    //variable to easy access. _allMovieList
    final _movieProvider = context.watch<FilterMovieProvider>();
    var _allMovieList = _movieProvider.getMovieDetails(
      _movieProvider.MovieIdex,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Details:",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
        ),
        titleTextStyle: TextStyle(color: Colors.white),
        backgroundColor: Colors.blueGrey[300],
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey[300],
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GreeenButton(
          callback: () {
            context.read<FilterMovieProvider>().setMovieIdex(
              _movieProvider.MovieIdex + 1,
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            spacing: 5,
            children: [
              //top and about mobie details...child 1
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 7,
                  children: [
                    Container(
                      height: 120,
                      width: 90,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            _allMovieList.image!.medium.toString(),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 230),
                          child: AutoSizeText(
                            _allMovieList.name.toString(),
                            maxLines: 2,
                            minFontSize: 20,
                            maxFontSize: 28,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              //   fontSize: 28,
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 2,
                          children: [
                            const Text(
                              "Genre:",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 185),
                              child: AutoSizeText(
                                _allMovieList.genres!.join(", "),
                                minFontSize: 10,
                                maxFontSize: 20,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  // fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          spacing: 2,
                          children: [
                            const Text(
                              "Rating:",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              _allMovieList.rating!.average!.toString(),
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          spacing: 2,
                          children: [
                            const Text(
                              "Release:",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              _allMovieList.premiered!,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //about liks and other small details....
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 2,
                      children: [
                        const Text(
                          "Language:",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 185),
                          child: AutoSizeText(
                            "${_allMovieList.language!} (${_allMovieList.network!.country!.code})",
                            minFontSize: 10,
                            maxFontSize: 20,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              // fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 2,
                      children: [
                        const Text(
                          "Status:",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          _allMovieList.status!,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 2,
                      children: [
                        const Text(
                          "Links:",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 240),
                          child: InkWell(
                            onTap: () {
                              UrlLauncher().launchURL(
                                _allMovieList.officialSite!,
                              );
                            },
                            child: AutoSizeText(
                              _allMovieList.officialSite ?? "Not availabe",
                              minFontSize: 12,
                              maxFontSize: 20,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                // fontSize: 15,
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //mobie describtion...child 3
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.15),
                ),
                child: Column(
                  spacing: 7,
                  children: [
                    Html(
                      data: _allMovieList.summary,
                      style: {
                        "body": Style(
                          fontSize: FontSize(18),
                          color: Colors.white,
                          textAlign: TextAlign.justify,
                        ),
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
