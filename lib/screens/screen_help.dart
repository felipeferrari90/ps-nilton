import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ScreenHelp extends StatelessWidget { 

  Widget build(BuildContext context) {
     //ModalRoute.of(context).settings.arguments

     return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(233, 28, 93, 1.0),
        title: Text("Ajuda Especializada"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
           
         
              Text("Caso você esteja passando por uma situação difícil e esteja se sentindo muito mal. Saiba de lugares que podem te ajudar a se sentir melhor:"),
              Padding(
                     padding: EdgeInsets.all(16.0),
                     child:  Center(
                         child: Text(" CVV - Centro de valorização da vida \n Disque 188 ou acesse https://www.cvv.org.br/chat/",
                         textAlign: TextAlign.center,
                         style: TextStyle(
                         fontWeight: FontWeight.bold,
                         ),
                     ),   
                  ),
              ),
              espaco(),
              Padding(
                     padding: EdgeInsets.all(16.0),
                     child:  Center(
                         child: Text("SAMU (Serviço de Atendimento Móvel de Urgência) \n Disque 192",
                         textAlign: TextAlign.center,
                         style: TextStyle(
                         fontWeight: FontWeight.bold,
                         ),
                     ),   
                  ),
              ),
              

              Text("SAMU (Serviço de Atendimento Móvel de Urgência)"),
              Text("Disque 192",textAlign: TextAlign.center),
              espaco(),
              Text("Você pode consultar especialistas também como psicólogos e psiquiatras."),
              Text("Lembre-se esses médicos estão agindo para te ajudar, você NÃO ESTÁ e NÃO É LOUCO"),
          ],
        ),
      ),
    );
  }

  SizedBox espaco() => SizedBox(
    height: 32,
  );


}
  