import 'package:flutter/material.dart';
import 'package:quizapp/data/listofquestions.dart';
import 'package:quizapp/result/result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color mainColor = Color.fromARGB(255, 39, 39, 39);
  Color secondColor = Color.fromARGB(255, 87, 35, 35);
  //page controller
  PageController? _controller = PageController(initialPage: 0);
  //game settings
  bool isPressed = false;
  Color isTrue = Colors.green;
  Color isWrong = Color.fromARGB(255, 87, 35, 35);
  Color btnColor = Color.fromARGB(255, 87, 35, 35);
  int score = 0;
  @override
  //background/variable declartion
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Padding(
        padding: EdgeInsets.all(18.0),
        //transitions
        child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller!,
            onPageChanged: (page) {
              setState(() {
                isPressed = false;
              });
            },
            itemCount: questions.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Question number
                  SizedBox(
                    width: double.infinity,
                    child: Text("Question ${index + 1} /${questions.length}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 28.0,
                        )),
                  ),
                  Text("Quiz App"),
                  const Divider(
                    color: Colors.white,
                    height: 8.0,
                    thickness: 1.0,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    questions[index].question!,
                    style: const TextStyle(color: Colors.white, fontSize: 28.0),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  //Answer button and conditions
                  for (int i = 0; i < questions[index].answer!.length; i++)
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 25.0),
                      child: MaterialButton(
                        shape: const StadiumBorder(),
                        color: isPressed
                            ? questions[index].answer!.entries.toList()[i].value
                                ? isTrue
                                : isWrong
                            : secondColor,
                        padding: EdgeInsets.symmetric(vertical: 18.0),
                        onPressed: isPressed
                            ? () {}
                            : () {
                                setState(() {
                                  isPressed = true;
                                });
                                if (questions[index]
                                    .answer!
                                    .entries
                                    .toList()[i]
                                    .value) {
                                  score += 1;
                                  print(score);
                                }
                              },
                        child: Text(
                          questions[index].answer!.keys.toList()[i],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  const SizedBox(height: 50.0),
                  //proceed button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: isPressed
                            ? index + 1 == questions.length
                                ? () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Result(score)));
                                  }
                                : () {
                                    _controller!.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.linear);
                                    setState(() {
                                      isPressed = false;
                                    });
                                  }
                            : null,
                        style: OutlinedButton.styleFrom(
                          shape: StadiumBorder(),
                          side: BorderSide(color: secondColor, width: 3.0),
                        ),
                        child: Text(
                          index + 1 == questions.length
                              ? "View score"
                              : "Proceed to next question",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }
}
