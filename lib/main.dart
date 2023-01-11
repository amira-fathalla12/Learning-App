// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'app_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AppBrain appBrain= AppBrain();
void main() {
  // ignore: prefer_const_constructors
  runApp( TestApp());
}
// ignore: use_key_in_widget_constructors
class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // ignore: prefer_const_constructors
        backgroundColor: Color.fromARGB(255, 224, 194, 230),
        appBar: AppBar(
          // ignore: prefer_const_constructors
          backgroundColor: Color.fromARGB(255, 189, 107, 203),
          // ignore: prefer_const_constructors
          title: Text('simpl test'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TestPage(),
        ),
      ),
    );
  }
}
// ignore: use_key_in_widget_constructors
class TestPage extends StatefulWidget {
  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  // ignore: non_constant_identifier_names
  List<Widget> Result = [];
  int rightAnswer = 0;
  void checkAnswer(bool whatUserPickeed){
    setState(() {
     bool correctAnswer =appBrain.getQuestionAnswer();
                if (whatUserPickeed== correctAnswer){
                  rightAnswer++;
                  Result.add(
                    // ignore: prefer_const_constructors
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      // ignore: prefer_const_constructors
                      child: Icon(Icons.thumb_up,
                      color: Colors.green,
                        ),
                    ),
                  );
                }else{
                  Result.add(
                    // ignore: prefer_const_constructors
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      // ignore: prefer_const_constructors
                      child: Icon(
                        Icons.thumb_down,
                        color: Colors.red,
                        ),
                    ),
                  );
                }
                if(appBrain.IsFinshed()==true){
                   Alert(
                     context: context,
                    title: "Finish",
                    desc: "you answer $rightAnswer question true from 6 ",
                    buttons: [
                      DialogButton(
                      // ignore: sort_child_properties_last
                      child: Text(
                           "New start",
                           style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      width: 120,
                    )
                 ],
               ).show();
               appBrain.reset();
               Result = [];
               rightAnswer = 0;
                }else{
                    appBrain.nextQuestion();                 
                  }
              });

  }
 
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: Result,
        ),
        Expanded(
          flex: 5,
          child: Column(children: [
            Image.asset(appBrain.getQuestionImage()),
            // ignore: prefer_const_constructors
            SizedBox(height: 20.0),
            // ignore: prefer_const_constructors
            Text(
              appBrain.getQuestionText(),
              textAlign: TextAlign.center,
            // ignore: prefer_const_constructors
              style: TextStyle(
                fontSize: 25.0,
            ),
            ),
          ],),
        ),
        Expanded(
          child:Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: OutlinedButton(
              // ignore: prefer_const_constructors
              child: Text('True',
              // ignore: prefer_const_constructors
              style: TextStyle(
                 fontSize: 30.0,
                 color: Colors.purple,
              ),
              ),
              onPressed: (){
                checkAnswer(true);
              },
              ),
          ) ),
        Expanded(
          child:Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: OutlinedButton(
              // ignore: prefer_const_constructors
              child: Text('False',
              // ignore: prefer_const_constructors
              style: TextStyle(
                 fontSize: 30.0,
                 // ignore: prefer_const_constructors
                 color: Color.fromARGB(255, 195, 95, 100),
              ),
              ),
              onPressed: (){
                 checkAnswer(false);
              },
              ),
          ) ),
      ],
    );
  }
}

