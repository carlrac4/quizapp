import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quizapp/main.dart';

class Result extends StatefulWidget {
  final int score;
  const Result(this.score, {Key? key}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

//result screen
class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    Color mainColor = Color.fromARGB(255, 39, 39, 39);
    Color secondColor = Color.fromARGB(255, 87, 35, 35);
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Good Job!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "your score is: ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              "${widget.score}",
              style: TextStyle(
                color: Colors.greenAccent,
                fontSize: 80.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 80.0,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              elevation: 0.0,
              color: secondColor,
              textColor: Colors.white,
              child: Text(
                "Click to retake the quiz",
              ),
            )
          ],
        ),
      ),
    );
  }
}
