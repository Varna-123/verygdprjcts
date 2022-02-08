import 'package:flutter/material.dart';

class Styles extends StatefulWidget {
  const Styles({Key? key}) : super(key: key);

  @override
  _StylesState createState() => _StylesState();
}

class _StylesState extends State<Styles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "myapp",
          style: TextStyle(
              fontFamily: "myfont", fontSize: 30, color: Colors.amber),
        ),
      ),
      body: Stack(children: [
        Image(
          image: AssetImage("assets/images/sampleimg.jpeg"),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.fill,
        ),
        Text(
          "hiiiiiiiiiiii",
          style: TextStyle(fontFamily: "myfont", fontSize: 50),
        ),
      ]),
    );
  }
}
