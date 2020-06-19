import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ps_goodbot/models/mensagem_model.dart';
import 'package:ps_goodbot/repository/mensagem_repository.dart';

class Bot {
  String mensagemPadrao = """
Desculpe, não consegui te entender 😁
Tente novamente! 
Selecione alguma das opções abaixo:""";

  String meConheca = """Olá! 🤖
Meu nome é Nilton, na verdade eu sou a versão "2.0" dele.
Nasci em 2018 com o objetivo de competir em uma LUTA! Acredita?



Desde que nasci, fui um robozinho bem simples e humilde. Ganhei algumas lutas, mas não consegui chegar ao final do campeonato. 😅


Agora EU VIM PRA INTERNET!
Gostei muito de conhecer aqui 😍
Aqui eu não sou mais lutador, eu me foquei em ajudar as pessoas a verem se elas têm indícios de depressão. 🏥""";

  String conselhos = """1. Ouça mais, fale menos
Encontre um momento apropriado e um lugar calmo para falar sobre suicídio com essa pessoa. Deixe-a saber que você está lá para ouvir, ouça-a com a mente aberta e ofereça seu apoio.

2. Incentive uma consulta profissional
Incentive a pessoa a procurar ajuda de um profissional, como um médico, profissional de saúde mental, conselheiro ou assistente social. Ofereça-se para acompanhá-la a uma consulta.

3. Fique perto
Se você acha que essa pessoa está em perigo imediato, não a deixe sozinha. Procure ajuda de profissionais de serviços de emergência, um serviço telefônico de atendimentos a crises, um profissional de saúde, ou consulte algum familiar dessa pessoa.

4. Previna
Se a pessoa que com quem você está preocupado (a) vive com você, assegure-se de que ele (a) não tenha acesso a meios para provocar a própria morte (por exemplo, pesticidas, armas de fogo ou medicamentos) em casa.

5. Mantenha contato
Fique em contato para acompanhar como a pessoa está passando e o que está fazendo.

NUNCA DIGA:
“Isso é covardia ”.
“É loucura”.
“É fraqueza”.
“É por isso que quer morrer? Já passei por coisas bem piores e não me matei”.
“Você quer chamar a atenção”.
“Isso é falta de vergonha na cara”.
“Tantas pessoas com problemas mais sérios que o seu, siga em frente”.
“Levanta a cabeça, deixa disso”.
“Pense positivo”.
“A vida é boa”.""";

  String ajudaEspecializada =
      """Caso você esteja passando por uma situação difícil e esteja se sentindo muito mal. Saiba de lugares que podem te ajudar a se sentir melhor:

CVV (Centro de valorização da vida) - Disque 188 ou acesse https://www.cvv.org.br/chat/

SAMU (Serviço de Atendimento Móvel de Urgência) - Disque 192

Você pode consultar especialistas também como psicólogos e psiquiatras. Lembre-se esses médicos estão agindo para te ajudar, você NÃO ESTÁ e NÃO É LOUCO!""";

  String inicioTeste =
      """Responda o questionário abaixo para avaliarmos como você está. Responda "sair" para sair do teste. 🏥
Favor dar a pontuação correspondente a opção!""";

  String opcoesTeste = """Não (0)
Alguns dias (1)
Muitos dias (2)
Sempre (3)""";

  List<String> perguntas;
  List<int> respostas;
  bool dentroTeste = false;
  String descricaoPontuacoes = """Se sua pontuação foi ZERO
Ótimo! Você não apresenta sinais de depressão.
Mesmo assim, você deve se manter atento todos os dias às suas emoções e ao seu estado de humor. Se você perceber mudanças que façam você se sentir mais melancólico, estressado ou ansioso por períodos mais prolongados, é recomendável buscar o auxílio de psicólogo ou de um médico psiquiatra.
Por isso, se você sentir que suas emoções têm tirado você do seu estado de equilíbrio, entenda que não há mal algum em buscar um profissional.

Pontuação de 1 a 4

Você apresenta sinais mínimos de depressão. Não descuide da sua saúde emocional e mental. Se achar que precisa de ajuda, pode ser um bom momento para buscar ao auxílio de um psicólogo, para evitar o agravamento do quadro.

Pontuação de 5 a 9

Você apresenta sinais depressão leve. É hora de se cuidar! A depressão pode estar começando a afetar sua vida de uma forma importante. Buscar a ajuda de um psicólogo ou médico psiquiatra pode ser uma boa ideia.

Pontuação de 10 a 14

Você apresenta sinais depressão moderada. A depressão provavelmente já está ocupando um espaço importante na sua vida. É recomendável que você busque um auxílio de um profissional de psicologia ou médico psiquiatra, quando possível.

Pontuação de 15 a 19

Você apresenta sinais depressão moderada a grave. É muito provável que a depressão esteja afetando significaticamente sua qualidade de vida. É altamente recomendável buscar o auxílio de um profissional de psicologia, o mais rápido possível.

Pontuação Acima de 19

Você apresenta sinais depressão a grave. A depressão provavelmente já afeta quase todas as áreas da sua vida. É indispensável que cuidar de você se torne uma prioridade absoluta em sua vida. Busque o mais rápido possível o auxílio de um profissional de psicologia ou médico psiquiatra.""";

  String resultadoTeste() {
    int pontuacao = 0;

    for (var ponto in respostas) {
      pontuacao += ponto;
    }

    return "Seu resultado é: " +
        pontuacao.toString() +
        "!\n\n" +
        "Mas LEMBRE-SE, este teste NÃO SUBSTITUI uma avaliação de um profissional de saúde competente!\n\n" +
        descricaoPontuacoes;
  }

  String testaDepressao(String msg) {
    if (!dentroTeste) {
      dentroTeste = true;
      return inicioTeste + "\n\n" + perguntas[0] + "\n" + opcoesTeste;
    }

    switch (msg) {
      case "sair":
        respostas = new List.filled(perguntas.length, -1);
        dentroTeste = false;
        return "Obrigado por pedir a minha ajuda!";
        break;

      case "0":
      case "1":
      case "2":
      case "3":
        for (var i = 0; i < respostas.length; i++) {
          if (respostas[i] < 0) {
            respostas[i] = int.parse(msg);
            if (i == respostas.length - 1) {
              dentroTeste = false;
              return resultadoTeste();
            } else {
              return perguntas[i + 1] + "\n" + opcoesTeste;
            }
          }
        }

        break;
      default:
        return "Por favor, digite uma opção entre 0 e 3, ou digite \"sair\" para sair do teste.";
    }

    return inicioTeste;
  }

  Bot() {
    perguntas = [
      "Eu tive pouco interesse ou pouco prazer em fazer as coisas:",
      "Me senti “para baixo”, deprimido ou sem perspectiva",
      "Tive dificuldade para pegar no sono ou permanecer dormindo, ou dormi mais do que de costume.",
      "Me senti cansado ou com pouca energia.",
      "Tive falta de apetite ou comi demais.",
      "Me senti mal comigo mesmo(a), me achei fracassado(a) ou acho que decepcionei minha família ou a mim mesmo(a).",
      "Senti dificuldade para me concentrar nas coisas, como ler o jornal ou assistir televisão.",
      "Senti que estava lento para me mover ou falar, a ponto das outras pessoas perceberem. Ou, ao contrário, me senti muito mais agitado ou inquieto do que de costume.",
      "Pensei em me ferir de alguma maneira ou pensei que seria melhor estar morto."
    ];

    respostas = new List.filled(perguntas.length, -1);
  }

  String menuOpcoes() {
    String resposta = "";

    resposta += mensagemPadrao + "\n";

    resposta += "1 - Me conheça!" + "\n";
    resposta += "2 - Verifique se está deprimido!" + "\n";
    resposta += "3 - Conselhos!" + "\n";
    resposta += "4 - Ajuda especializada!" + "\n";

    return resposta;
  }

  MensagemModel iniciar() {
    return MensagemModel(
      mensagem: meConheca + menuOpcoes(),
      remetente: "robo",
    );
  }

  MensagemModel responda(String msgUsuario) {
    if (dentroTeste) {
      return MensagemModel(
          mensagem: testaDepressao(msgUsuario), remetente: "robo");
    } else {
      switch (msgUsuario) {
        case "1":
          return MensagemModel(mensagem: meConheca, remetente: "robo");
        case "2":
          return MensagemModel(
              mensagem: testaDepressao(msgUsuario), remetente: "robo");
        case "3":
          return MensagemModel(mensagem: conselhos, remetente: "robo");
        case "4":
          return MensagemModel(mensagem: ajudaEspecializada, remetente: "robo");

          break;
        default:
          return MensagemModel(mensagem: menuOpcoes(), remetente: "robo");
      }
    }
  }
}

class ScreenChat extends StatefulWidget {
  @override
  _ScreenChatState createState() => _ScreenChatState();
}

class _ScreenChatState extends State<ScreenChat> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  MensagemRepository mensagemRepository = MensagemRepository();
  ListView lista;
  Bot bot = Bot();
  MensagemModel mensagemBot;

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
            if (snapshot.data.length == 0) {
              mensagemRepository.createRaw(bot.iniciar());
              return Column(
                children: <Widget>[
                  Dismissible(
                    key: Key("0"),
                    child: cardMensagem(bot.iniciar()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      print(direction);
                      mensagemRepository.deleteRaw(MensagemModel(id: 0));
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
                  ),
                  novaMensagem(),
                ],
              );
            }
            return Column(
              children: <Widget>[
                Expanded(
                  child: buildListView(snapshot.data),
                ),
                novaMensagem(),
              ],
            );
          }
          return Text("Carregando...");
        },
      ),
    );
  }

  ListView buildListView(List<MensagemModel> mensagens) {
    return ListView.builder(
      reverse: true,
      shrinkWrap: true,
      itemCount: mensagens == null ? 0 : mensagens.length,
      itemBuilder: (BuildContext ctx, int index) {
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
                    //inseri a mensagem do usuário no chat
                    mensagemRepository.createRaw(MensagemModel(
                        mensagem: controllerTexto.text, remetente: "usuario"));

                    mensagemBot = bot.responda(controllerTexto.text);
                    if (mensagemBot != null) {
                      mensagemRepository.createRaw(mensagemBot);
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
