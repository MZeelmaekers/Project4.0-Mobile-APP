import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
            ),
            const Text(
              "VITO Anlayser app",
              style: TextStyle(
                fontSize: 40.0,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(30, 50) // put the width and height you want
                  ),
              onPressed: () {
                _navigateToUpload();
              },
              child: const Text(
                "Upload picture",
                style: TextStyle(
                  fontSize: 20.0,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(30, 50) // put the width and height you want
                  ),
              onPressed: () {
                _navigateToPhoto();
              },
              child: const Text(
                "Take picture",
                style: TextStyle(
                  fontSize: 20.0,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(30, 50) // put the width and height you want
                  ),
              onPressed: () {
                _navigateToResults();
              },
              child: const Text(
                "Show Results",
                style: TextStyle(
                  fontSize: 20.0,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToUpload() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UploadPage()),
    );
  }

  void _navigateToPhoto() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PhotoPage()),
    );
  }

  void _navigateToResults() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResultsPage()),
    );
  }
}