import 'package:flutter/material.dart';

class HomeBot extends StatefulWidget {
  @override
  _HomeBotState createState() => _HomeBotState();
}

class _HomeBotState extends State<HomeBot> {
  
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  String username;
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text("THE GOOD BOT"),
            ),
            backgroundColor: Color.fromRGBO(233, 28, 93, 1.0),
          ),
          backgroundColor: Color.fromRGBO(173, 181, 194, 1.0),
          body: Column( 
          children: <Widget>[
             Center(
                child: Center( 
                  child: Image.asset("../assets/images/robo.png", scale: 0.15),
                ),
             ),
             SizedBox(
                height: 100.0,
                width: double.infinity,
                child: Center( 
                  child:Text("NILTON 2.0", 
                    style: TextStyle(
                       color: Colors.indigo[900],
                    ),
                  ),
                ),
             ),
             Form(
               key: formKey,
               child:Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: new InputDecoration(
                      hintText: 'Digite o seu nome',
                      labelText: 'Nome',
                      contentPadding: EdgeInsets.all(24.0),
                      
                    ),
                      validator: (value) {
                      if (value.isEmpty) {
                        return 'Digite o seu nome';
                      }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      onSaved: (value){
                          username = value;
                      },
                    ),
                  ],
               ) 
                   
             ),
             Padding(
                 padding: const EdgeInsets.all(16.0),
                 child: RaisedButton(
                    child: Text("Vamos começar"),
                    onPressed: (){ 
                      if(formKey.currentState.validate()){
                            Navigator.pushNamed(context,"/bot_opcoes", arguments: username);
                      }
                    },
                ),
            ),
          ]
       ), 
    );
  }
}