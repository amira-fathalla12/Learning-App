import 'question.dart';
class AppBrain{
  // ignore: non_constant_identifier_names
  int _QuestionNumber = 0;
   // ignore: prefer_final_fields
   List<Question> _questionGroup =[
    Question(
          q: 'الليمون ذات طعم لاذع',
          i:  "images/image-1.jpeg",
          a:    true,
          ),
    Question(
          q: 'الزرافه تمتلك رقبه قصيرة؟',
          i:  "images/image-2.jpeg",
          a:    false,
          ), 
    Question(
          q:     'هل البطاطس من الفاكه؟',
          i:  "images/image-3.jpeg",
          a:    false,
          ), 
    Question(
          q:     'الثلج اكثر بروده من الماء؟',
          i:  "images/image-4.jpeg",
          a:    true,
          ),
   Question(
          q:   'هل الدم أحمر اللون',
          i:  "images/image-5.jpeg",
          a:    true,
          ), 
   Question(
          q:   'الشمس دائرية الشكل؟',
          i:  "images/image-6.jpeg",
          a:    true,
          ),   
  ];

  void nextQuestion(){
    if(_QuestionNumber< _questionGroup.length -1){
      _QuestionNumber++;
    }
  }

  String getQuestionText (){
    return _questionGroup[_QuestionNumber].questionText;
  }
  String getQuestionImage (){
    return _questionGroup[_QuestionNumber].questionImage;
  } 
  bool getQuestionAnswer (){
        return _questionGroup[_QuestionNumber].questionAnswer;
  }
  bool IsFinshed (){
    if(_QuestionNumber >= _questionGroup.length -1){
      return true;
    }else {
      return false;
    }
  }
  void reset(){
    _QuestionNumber = 0;
  }
}