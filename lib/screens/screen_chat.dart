import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ps_goodbot/models/mensagem_model.dart';
import 'package:ps_goodbot/repository/mensagem_repository.dart';

class ScreenChat extends StatefulWidget {
  @override
  _ScreenChatState createState() => _ScreenChatState();
}

class _ScreenChatState extends State<ScreenChat> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  MensagemRepository mensagemRepository = MensagemRepository();
  ListView lista;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(233, 28, 93, 1.0),
        title: Text("Converse comigo..."),
      ),
      body: FutureBuilder<List>(
        future: mensagemRepository.findAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data.length > 0) {
              return buildListView(snapshot.data);
              /*return TextFormField(
                      decoration: new InputDecoration(
                        hintText: 'Digite o seu nome',
                        labelText: 'Nome',
                        contentPadding: EdgeInsets.all(5.0),                      
                      ),                      
                    );
              */
            } else {
              return Center(
                child: novaMensagem(),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  ListView buildListView(List<MensagemModel> mensagens) {
    return ListView.builder(
      itemCount: mensagens == null ? 0 : mensagens.length + 1,
      itemBuilder: (BuildContext ctx, int index) {
        if (index == mensagens.length) {
          return novaMensagem();
        }

        return Dismissible(
          key: Key(mensagens[index].id.toString()),
          child: cardMensagem(mensagens[index]),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            print(direction);
            mensagemRepository.deleteRaw(mensagens[index]);
            setState(() {});
          },
          background: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: AlignmentDirectional.centerEnd,
              color: Colors.redAccent,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Card novaMensagem() {
    var controllerTexto = TextEditingController();

    return Card(
      child: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: controllerTexto,
              decoration: new InputDecoration(
                hintText: 'Digite sua mensagem',
                labelText: 'Mensagem',
                contentPadding: EdgeInsets.all(5.0),
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    mensagemRepository.createRaw(MensagemModel(
                        mensagem: controllerTexto.text, remetente: "usuario"));
                    switch (controllerTexto.text) {
                      case "1":
                        mensagemRepository.createRaw(MensagemModel(
                            mensagem: "Olá usuário", remetente: "robo"));

                        break;

                      default:
                        mensagemRepository.createRaw(MensagemModel(
                            mensagem: "Desculpe, não entendi!", remetente: "robo"));
                    }
                    setState(() {});
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Card cardMensagem(MensagemModel modeloMensagem) {
  return Card(
    color: modeloMensagem.remetente == "robo"
        ? null
        : Color.fromRGBO(0, 191, 255, 1),
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Container(
          alignment: modeloMensagem.remetente == "robo"
              ? Alignment.centerLeft
              : Alignment.centerRight,
          child: Text(
            modeloMensagem.mensagem,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}
