import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ScreenAdvise extends StatelessWidget { 

  Widget build(BuildContext context) {
     //ModalRoute.of(context).settings.arguments

     return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(233, 28, 93, 1.0),
        title: Text("Como Ajudar Alguém"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
                 children: <Widget>[
                   Card(
                     child: Padding(
                     padding: EdgeInsets.all(16.0),
                         child:  Center(
                            child: Text("1. Ouça mais, fale menos encontre um momento apropriado e um lugar calmo para falar sobre suicídio com essa pessoa. Deixe-a saber que você está lá para ouvir, ouça-a com a mente aberta e ofereça seu apoio",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                            fontWeight: FontWeight.bold,
                                ),
                            ),   
                         ),
                      ), 
                   ),
                    Card(
                     child: Padding(
                     padding: EdgeInsets.all(16.0),
                         child:  Center(
                            child: Text("2. Incentive uma consulta profissional, incentive a pessoa a procurar ajuda de um profissional, como um médico, profissional de saúde mental, conselheiro ou assistente social. Ofereça-se para acompanhá-la a uma consulta.",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                            fontWeight: FontWeight.bold,
                                ),
                            ),   
                         ),
                      ), 
                   ),
                    Card(
                     child: Padding(
                     padding: EdgeInsets.all(16.0),
                         child:  Center(
                            child: Text("3. Fique perto, se você acha que essa pessoa está em perigo imediato, não a deixe sozinha. Procure ajuda de profissionais de serviços de emergência, um serviço telefônico de atendimentos a crises, um profissional de saúde, ou consulte algum familiar dessa pessoa.",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                            fontWeight: FontWeight.bold,
                                ),
                            ),   
                         ),
                      ), 
                   ),
                    Card(
                     child: Padding(
                     padding: EdgeInsets.all(16.0),
                         child:  Center(
                            child: Text("4. Previna se a pessoa que com quem você está preocupado (a) vive com você, assegure-se de que ele (a) não tenha acesso a meios para provocar a própria morte (por exemplo, pesticidas, armas de fogo ou medicamentos) em casa.",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                            fontWeight: FontWeight.bold,
                                ),
                            ),   
                         ),
                      ), 
                   ),
                    Card(
                     child: Padding(
                     padding: EdgeInsets.all(16.0),
                         child:  Center(
                            child: Text('5. Mantenha contato fique em contato para acompanhar como a pessoa está passando e o que está fazendo. NUNCA DIGA: \n \"Isso é covardia\".\n \“É loucura\”.\n \“É fraqueza\”.\n\“É por isso que quer morrer? Já passei por coisas bem piores e não me matei\”.\n\“Você quer chamar a atenção\”.\n\“Isso é falta de vergonha na cara\”.\n\“Tantas pessoas com problemas mais sérios que o seu, siga em frente\”.\n\“Levanta a cabeça, deixa disso\”.\n\“Pense positivo\”.\n\“A vida é boa\”.',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                            fontWeight: FontWeight.bold,
                                ),
                            ),   
                         ),
                      ), 
                   ),
                 ],
              ),
        ),
      );
  }
}
  