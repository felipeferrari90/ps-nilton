import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ScreenBotAbout extends StatelessWidget { 

  Widget build(BuildContext context) {
     //ModalRoute.of(context).settings.arguments

     return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(233, 28, 93, 1.0),
        title: Text("Sobre mim"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
                 children: <Widget>[
                   Text("""Olá! 🤖
                   
Meu nome é Nilton, na verdade eu sou a versão "2.0" dele.
Nasci em 2018 com o objetivo de competir em uma LUTA! Acredita?

Desde que nasci, fui um robozinho bem simples e humilde. Ganhei algumas lutas, mas não consegui chegar ao final do campeonato. 😅

Agora EU VIM PROS CELULARES!
Gostei muito de conhecer aqui 😍
Aqui eu não sou mais lutador, eu me foquei em ajudar as pessoas a verem se elas têm indícios de depressão. 🏥"""),
                 ],
              ),
        ),
      );
  }
}
  