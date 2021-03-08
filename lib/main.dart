import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(
      MaterialApp(
        home: BallPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  });
}

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Center(
          child: NeumorphicText(
            'Ask Me Anything!',
            style: NeumorphicStyle(
                color: Colors.grey[400], shadowLightColor: Colors.black),
            textStyle: NeumorphicTextStyle(
              fontFamily: 'DotGothic16',
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;
  void randomise() {
    ballNumber = Random().nextInt(5) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topCenter,
          //height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(09),
          child: NeumorphicText(
            '\bStuck making decisions? \n\n'
            'With a Yes/No question on your mind, just click on this button and help yourself decide!',
            style: NeumorphicStyle(
                color: Colors.black,
                shadowDarkColor: Colors.grey,
                shadowLightColor: Colors.white),
            textStyle: NeumorphicTextStyle(
              fontFamily: 'AkayaTelivigala',
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 15,
        ),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: NeumorphicButton(
                onPressed: () {
                  setState(() {
                    randomise();
                    print(ballNumber);
                  });
                },
                style: NeumorphicStyle(
                    color: Colors.grey[400],
                    depth: 5,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(70)),
                    shadowDarkColor: Colors.black,
                    shadowLightColor: Colors.white),
                child: Image.asset('images/ball$ballNumber.png'),
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 10,
        ),
        Container(
          height: MediaQuery.of(context).size.height / 9,
          padding: EdgeInsets.all(09),
          alignment: Alignment.bottomCenter,
          child: NeumorphicText(
            'DISCLAIMER: This application is just for entertainment purpose.\n If your decision is something serious, please don'
            't completely rely on this suggestion. ',
            style: NeumorphicStyle(
                color: Colors.black,
                shadowLightColor: Colors.orange[200],
                shadowDarkColor: Colors.black),
            textStyle: NeumorphicTextStyle(
              fontFamily: 'AkayaTelivigala',
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
}
