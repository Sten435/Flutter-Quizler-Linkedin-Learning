import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Icon green = Icon(
    Icons.check,
    color: Colors.green,
  );

  Icon red = Icon(
    Icons.close,
    color: Colors.red,
  );

  List<Widget> scoreKeeper = [];

  void checkAwnser(bool userAwnser) {
    bool awnser = quizBrain.getQuestionAwnser();

    if (userAwnser == awnser) {
      scoreKeeper.add(green);
    } else {
      scoreKeeper.add(red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () async {
                setState(
                  (() {
                    validateAwnser(true);
                  }),
                );
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    validateAwnser(false);
                  });
                }),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }

  bool lastquestion = false;
  bool isEnded = false;

  void validateAwnser(bool userAwnser) {
    checkAwnser(userAwnser);

    if (quizBrain.lastQuestion()) {
      Alert(
        context: context,
        title: "Complete",
        desc: "We have no more questions.",
        style: AlertStyle(
            titleStyle: TextStyle(
          color: Colors.white,
          fontSize: 12.0,
        )),
      ).show();

      setState(() {
        quizBrain.reset();
        scoreKeeper.clear();
      });
    } else {
      quizBrain.nextQuestion();
    }
  }
}
