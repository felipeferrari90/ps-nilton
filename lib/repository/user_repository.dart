import 'package:ps_goodbot/models/user_model.dart';
import 'package:ps_goodbot/repository/database_helper.dart';

class CursoRepository {
  // Instancia do Database Helper
  DatabaseHelper _databaseHelper;

  // Construtor
  CursoRepository() {
    _databaseHelper = new DatabaseHelper();
  }

  Future<List<CursoModel>> findAll() async {
    var connection = await _databaseHelper.connection;
    var result = await connection.query(
      "UserModel",
      columns: [
        "id",
        "nome",
        "pontos",
      ],
    );

    // Converte a lista de Maps para Lista de Cursos
    List<CursoModel> listaCursos = new List<CursoModel>();
    for (Map i in result) {
      listaCursos.add(CursoModel.fromMap(i));
    }

    return listaCursos;
  }

  Future<int> create(CursoModel cursoModel) async {
    var connection = await _databaseHelper.connection;
    var result = await connection.insert(
      "CursoModel",
      cursoModel.toMap(),
    );
    return result;
  }

  Future<int> createRaw(UserModel userModel) async {
    var connection = await _databaseHelper.connection;
    var sqlCommand = " INSERT INTO UserModel ( " +
        "  nome , " +
        "  pontos ) " +
        "VALUES ( " +
        "    '${userModel.nome}' , " +
        "    '${cursoModel.pontos}' " +
        "  ) ";

    var result = await connection.rawInsert(sqlCommand);
    return result;
  }

  Future<UserModel> get(int id) async {
    var connection = await _databaseHelper.connection;
    List<Map> results = await connection.query(
      "CursoModel",
      columns: [
        "id",
        "nome",
        "pontos"
      ],
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.length > 0) {
      return CursoModel.fromMap(
        results.first,
      );
    } else {
      return null;
    }
  }

  Future<CursoModel> getRaw(int id) async {
    var connection = await _databaseHelper.connection;
    var sqlCommand = "SELECT * FROM UserModel WHERE ID = $id  ";

    var results = await connection.rawQuery(sqlCommand);
    if (results.length > 0) {
      return new UserModel.fromMap(results.first);
    } else {
      return null;
    }
  }
}
