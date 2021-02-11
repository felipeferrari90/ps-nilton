import 'package:ps_goodbot/models/mensagem_model.dart';
import 'package:ps_goodbot/repository/database_helper.dart';

class MensagemRepository {
  // Instancia do Database Helper
  DatabaseHelper _databaseHelper;

  // Construtor
  MensagemRepository() {
    _databaseHelper = new DatabaseHelper();
  }

  Future<List<MensagemModel>> findAll() async {
    //this.createRaw(MensagemModel(mensagem: "Mensagem robo 1", remetente: "robo"));
    //this.createRaw(MensagemModel(mensagem: "Mensagem 2", remetente: "usuario"));
    //this.createRaw(MensagemModel(mensagem: "Mensagem 3", remetente: "robo"));
    //this.createRaw(MensagemModel(mensagem: "Mensagem 4", remetente: "robo"));
    //this.createRaw(MensagemModel(mensagem: "Mensagem 5", remetente: "usuario"));
    var connection = await _databaseHelper.connection;
    var result = await connection.query(
      "MensagemModel",
      columns: [
        "id",
        "mensagem",
        "remetente",
      ],
    );


    // Converte a lista de Maps para Lista de Cursos
    List<MensagemModel> listaCursos = new List<MensagemModel>();

    for (Map i in result) {
      listaCursos.add(MensagemModel.fromMap(i));
    }
    listaCursos = listaCursos.reversed.toList();

    return listaCursos;
  }

  Future<int> create(MensagemModel mensagemModel) async {
    var connection = await _databaseHelper.connection;
    var result = await connection.insert(
      "MensagemModel",
      mensagemModel.toMap(),
    );
    return result;
  }

  Future<int> createRaw(MensagemModel mensagemModel) async {
    var connection = await _databaseHelper.connection;
    var sqlCommand = " INSERT INTO MensagemModel ( " +
        "  mensagem, " +
        "  remetente) " +
        "VALUES ( " +
        "    '${mensagemModel.mensagem}' , " +
        "    '${mensagemModel.remetente}'" +
        "  ) ";

    var result = await connection.rawInsert(sqlCommand);
    return result;
  }

  Future<MensagemModel> get(int id) async {
    var connection = await _databaseHelper.connection;
    List<Map> results = await connection.query(
      "MensagemModel",
      columns: [
        "id",
        "mensagem",
        "remetente",
      ],
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.length > 0) {
      return MensagemModel.fromMap(
        results.first,
      );
    } else {
      return null;
    }
  }

  Future<MensagemModel> getRaw(int id) async {
    var connection = await _databaseHelper.connection;
    var sqlCommand = "SELECT * FROM MensagemModel WHERE ID = $id  ";

    var results = await connection.rawQuery(sqlCommand);
    if (results.length > 0) {
      return new MensagemModel.fromMap(results.first);
    } else {
      return null;
    }
  }

  Future<int> update(MensagemModel mensagemModel) async {
    var connection = await _databaseHelper.connection;
    return await connection.update(
      "MensagemModel",
      mensagemModel.toMap(),
      where: "id = ?",
      whereArgs: [mensagemModel.id],
    );
  }

  Future<int> updateRaw(MensagemModel mensagemModel) async {
    var connection = await _databaseHelper.connection;
    var sqlCommand = " UPDATE MensagemModel SET  " +
        "  mensagem = '${mensagemModel.mensagem}' , " +
        "  remetente = '${mensagemModel.remetente}'  " +
        " WHERE id = ${mensagemModel.id} ";

    var result = await connection.rawUpdate(sqlCommand);
    return result;
  }

  Future<void> delete(MensagemModel mensagemModel) async {
    var connection = await _databaseHelper.connection;
    return await connection.delete(
      "MensagemModel",
      where: "id = ?",
      whereArgs: [mensagemModel.id],
    );
  }

  Future<void> deleteRaw(MensagemModel mensagemModel) async {
    var connection = await _databaseHelper.connection;
    var sqlCommand =
        " DELETE FROM MensagemModel   " + " WHERE id = ${mensagemModel.id} ";

    var result = await connection.rawDelete(sqlCommand);
    return result;
  }
}
