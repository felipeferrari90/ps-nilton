import 'package:flutter/material.dart';

class ScreenQuestions extends StatefulWidget {
  @override
  _ScreenQuestionsState createState() => _ScreenQuestionsState();
}

class _ScreenQuestionsState extends State<ScreenQuestions> {

  String questao;
  int resultado;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(64, 75, 96, .9),
          title: Text("Questionario"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children:<Widget>[
              Container(
                child:Text("Responda o questionário abaixo para avaliarmos com você está. favor dar a pontuação correspondente a opção:"),
              ),
              QuestionBot(),
            ], 
         ),
      ),
    );
  }
}

class QuestionBot extends StatefulWidget {
  
  String pergunta;
  
  QuestionBot({
    this.pergunta,
    Key key,
  }) : super(key: key);

  @override
  _QuestionBotState createState() => _QuestionBotState();
}

class _QuestionBotState extends State<QuestionBot> {
  
  
  String selected;
  int total = 0;
  
 
  
  @override
  Widget build(BuildContext context) {
    return Column(
       children: <Widget>[
         Container(
            padding: EdgeInsets.all(16.0),
            child: Text("pergunta valendo 1miao de reais"),
         ),
         Center(
            child: DropdownButtonFormField<String>(
            elevation: 12,
            value: selected,
            items: ["Não (0)", "Alguns dias (1)", "Muitos Dias (2)", "Sempre (3)"].map((label) =>               DropdownMenuItem(
                child: Center(child: Text(label)),
                value: label,
              ))
            .toList(),
            onChanged: (value) {
            setState(() =>  selected = value);
                   },
            )
         )
       ]
     ); 
  }
}