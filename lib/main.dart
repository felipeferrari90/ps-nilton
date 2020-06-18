import 'package:flutter/material.dart';
import 'package:ps_goodbot/screens/home_bot.dart';
import 'package:ps_goodbot/screens/screen_advise.dart';
import 'package:ps_goodbot/screens/screen_help.dart';
import 'package:ps_goodbot/screens/screen_options.dart';
import 'package:ps_goodbot/screens/screen_questions.dart';
import 'package:ps_goodbot/screens/screen_bot_about.dart';
import 'package:ps_goodbot/screens/screen_chat.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "THE GOOD BOT",
      initialRoute: "/",
      routes: {
        '/': (context) => HomeBot(),
        '/bot_opcoes': (context) => ScreenOptions(),
        '/bot_questoes': (context) => ScreenChat(),
        '/bot_ajuda': (context) => ScreenHelp(),
        '/bot_aconselhe_alguem': (context) => ScreenAdvise(),
        '/bot_about': (context) => ScreenBotAbout(),
      },
     
    );
  }
  
}