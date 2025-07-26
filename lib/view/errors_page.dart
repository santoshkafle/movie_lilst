import 'package:flutter/material.dart';

class ErrorsPage extends StatelessWidget {
  const ErrorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          spacing: 2,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Failed to load movie data!",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/loading");
              },
              icon: Icon(Icons.refresh, size: 40, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
