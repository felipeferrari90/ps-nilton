import 'package:flutter/material.dart';

class ScreenOptions extends StatefulWidget {
  @override
  _ScreenOptionsState createState() => _ScreenOptionsState();
}

class _ScreenOptionsState extends State<ScreenOptions> {

  

  @override
  Widget build(BuildContext context) {
    String username = ModalRoute.of(context).settings.arguments;
    return Scaffold(
       appBar: AppBar(
         title: Center(
           child: Text("Opções"),
         ),
         backgroundColor: Color.fromRGBO(233, 28, 93, 1.0),
       ),
       body: Container(
       padding: const EdgeInsets.all(16.0),
       color: Colors.blueGrey[400], 
       child: Center(
         heightFactor: 3.0,
         child: Column(
         children: <Widget>[
            
              
                Expanded(
                  child: RaisedButton(
                    color: Color.fromRGBO(173, 181, 194, 1.0),
                    child: Center(
                      child: Text("SOBRE MIM")
                    ),
                    onPressed: (){
                      Navigator.pushNamed(context,"/bot_about",arguments: username);
                    },
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    color: Color.fromRGBO(177, 181, 184, 1.0),
                    child: Center(
                      child: Text("Verifique se esta deprimido")
                    ),
                    onPressed: (){
                      Navigator.pushNamed(context,"/bot_questoes",arguments: username);
                    },
                  ),
                ),
              
           
                Expanded(
                  child: RaisedButton(
                    color: Color.fromRGBO(173, 181, 194, 1.0),
                    child: Center(
                      child: Text("Ajuda Especializada")
                    ),
                     onPressed: (){
                      Navigator.pushNamed(context,"/bot_ajuda",arguments: username);
                    },
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    color: Color.fromRGBO(177, 181, 184, 1.0),
                    child: Center(
                      child: Text("Aconselhe Alguem")
                    ),
                     onPressed: (){
                      Navigator.pushNamed(context,"/bot_aconselhe_alguem",arguments: username);
                    },
                  ),
                ),

                 /*Expanded(
                  child: RaisedButton(
                    color: Color.fromRGBO(173, 181, 194, 1.0),
                    child: Center(
                      child: Text("Historico de visitas")
                    ),
                     onPressed: (){
                      Navigator.pushNamed(context,"/screen_pontos",arguments: username);
                    },
                  ),
                ),*/
             
         ],
       ), 
       ),
     ),
    );
  }
}