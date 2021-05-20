import 'package:flutter/material.dart';
import 'quiz_brainy.dart';
void main() {
  runApp(Quizzler());
}
 QuizBrainy quizBrainy =QuizBrainy();
class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        backgroundColor: Colors.grey[850],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:10.0),
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
  List<Icon> scoreKeeper = [];

  void checkAns(bool choseAns){
   bool rightAns = quizBrainy.getRightAns();

   setState(() {
    if(rightAns == choseAns){
      scoreKeeper.add(Icon(
        Icons.check,
        color: Colors.green[900],
      ));
    }
    else if(quizBrainy.finishChoice()== true){
      quizBrainy.getBack();
      scoreKeeper=[];
    }
    
    else {
      scoreKeeper.add(Icon(
        Icons.close,
        color: Colors.red[900],
        ));
    }
    quizBrainy.nextQues();
    

   });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget> [
       Expanded(
         flex:5 ,
         child:Padding(
           padding: EdgeInsets.all(10.0),
           child: Center(
             child: Text(
               quizBrainy.getQuesText(),
               textAlign: TextAlign.center,
               style: TextStyle(
                 color:Colors.white,
                 fontSize: 25.0,
               ),
             ),
             ),
       ),
       ),
       Expanded(
         child: Padding(
           padding: EdgeInsets.all(15.0) ,
           child: TextButton(
             style:TextButton.styleFrom(
               backgroundColor:Colors.green ),
            child:Text('TRUE',
            style: TextStyle(
              fontSize:20.0,
              color:Colors.black,
            ),
            ),
            onPressed:(){
              checkAns(true);
            },
           ),
          ),      
        ),
         
        Expanded(
          child:Padding(
            padding:EdgeInsets.all(15.0) ,
           child: TextButton(
             style:TextButton.styleFrom(
               backgroundColor:Colors.red[600]),
            child:Text('FALSE',
            style: TextStyle(
              fontSize:20.0,
              color:Colors.black,
            ),
            ),
            onPressed:(){
              checkAns(false);
            },
           ),
            )
          ),
         Row(
           children:scoreKeeper,
           
         ),

      ],
      
    );
  }
}