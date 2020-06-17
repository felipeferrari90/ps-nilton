
import 'dart:convert';

class UserModel {
    int id;
    String nome;
    int pontos;

    CursoModel({
        this.id,
        this.nome,
        this.pontos,
    });

    factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CursoModel.fromMap(Map<String, dynamic> json) => CursoModel(
        id: 
          (json["id"] is int)  ? json["id"] : int.parse(json["id"]),
        nome: json["nome"],
        pontos: json["pontos"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nome": nome,
        "pontos": pontos,
    };
}