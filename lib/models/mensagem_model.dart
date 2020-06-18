
import 'dart:convert';

class MensagemModel {
    int id;
    String mensagem;
    String remetente;

    MensagemModel({
        this.id,
        this.mensagem,
        this.remetente,
    });

    factory MensagemModel.fromJson(String str) => MensagemModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MensagemModel.fromMap(Map<String, dynamic> json) => MensagemModel(
        id: json["id"],
        mensagem: json["mensagem"],
        remetente: json["remetente"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "remetente": remetente,
        "mensagem": mensagem,
    };
}