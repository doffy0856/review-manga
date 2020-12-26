import 'package:flutter/material.dart';
import 'package:reviewmanga/menupage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manga Review',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 80.0),
                  child: new Text(
                    "Manga Review",
                    style: new TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                    ),
                  ),
                )
              ],
            ),
            new Container(
              height: 250,
              width: 370,
              child: Image.asset('images/jump-bg.jpg'),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 60.0, right: 60.0, top: 40.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MenuPage(),
                            ));
                      },
                      child: new Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          decoration: new BoxDecoration(
                              color: Color(0xFF18D191),
                              borderRadius: new BorderRadius.circular(9.0)),
                          child: new Text("Start In Review",
                              style: new TextStyle(
                                  fontSize: 20.0, color: Colors.white))),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
