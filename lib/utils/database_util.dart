import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

// Classe responsável por acessar o banco de dados
class DbUtil {
  static Future<sql.Database> database() async {
    final dbPath =
        await sql.getDatabasesPath(); // Caminho onde vai armazenar o database
    return sql.openDatabase(
      path.join(dbPath, 'places.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE places (id TEXT PRIMARY KEY, title TEXT, image TEXT, lat REAL, lng REAL, address TEXT)');
      },
      version: 1,
    );
  }

  // Inserir no Banco de Dados
  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DbUtil.database();
    await db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DbUtil.database();
    return db.query(table);
  }
}
