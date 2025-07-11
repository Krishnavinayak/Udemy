import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BallPage(),
  ));
}

class BallPage extends StatelessWidget {
  const BallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Color(0xff00008B),
        title: Text(
          "Ask Me Anything",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
      ),
      body: BallPg(),
    );
  }
}

class BallPg extends StatefulWidget {
  const BallPg({super.key});

  @override
  State<BallPg> createState() => _BallPgState();
}

class _BallPgState extends State<BallPg> {
  int ballNumber = 1 ;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          setState(() {
            ballNumber = Random().nextInt(5) + 1 ;
          });
        },
        child: Image.asset('images/ball$ballNumber.png')
        ),
    );
  }
}
