import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:movie_list/helper/filter_movie_provider.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadData();
  }

  Future<void> loadData() async {
    final _connectionResult = await (Connectivity().checkConnectivity());
    if (_connectionResult == ConnectivityResult.none) {
      Navigator.pushNamed(context, "/errorsPage");
      return;
    }

    //if have internet...
    context
        .read<FilterMovieProvider>()
        .initilizeMovie()
        .then((haveMovie) {
          if (haveMovie) {
            Navigator.pushNamed(context, "/home");
          } else {
            Navigator.pushNamed(context, "/errorsPage");
          }
        })
        .catchError((e) {
          Navigator.pushNamed(context, "/errorsPage");
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
