import 'package:flutter/material.dart';
import 'package:ps_goodbot/models/user_model.dart';
import 'package:ps_goodbot/repository/user_repository.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  UserRepository userRepository = UserRepository();

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(233, 28, 93, 1.0),
        title: Text("Cursos"),
      ),
      backgroundColor: Color.fromRGBO(173, 181, 194, 1.0),
      body: FutureBuilder<List>(
        future: userRepository.findAll(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            String erro = snapshot.error.toString();
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'Erro ao carregar as ultimas pontuações. \n Detalhes: $erro'),
              ),
            );
          } else {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data.length > 0) {
                return listUsers(snapshot.data);
              } else {
                return Center(
                  child: Text("Nenhum curso cadastrado!"),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }
        },
      ),
    );
  }

  ListView listUsers(List<UserModel> users) {
    return ListView.builder(
      itemCount: users == null ? 0 : users.length,
      itemBuilder: (BuildContext ctx, int index) {
        return Container(
          key: Key(users[index].id.toString()),
          child: containerUsers(users[index]),
          background: Padding(
            padding: const EdgeInsets.all(8.0),
            ),
          ),
        );
      },
    );
  }

  Card containerUsers(UserModel user) {
    return Card(
      elevation: 12.0,
      margin: new EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: Container(
        decoration: BoxDecoration(
             color: Color.fromRGBO(173, 181, 194, 1.0),
        ),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
              padding: EdgeInsets.only(right: 12.0),
          ),
          title: Text(
            user.nome,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            user.pontos,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ), 
      ),
    );     
  },
}
