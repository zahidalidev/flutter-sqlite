import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:assignment11/model/project_model.dart';

class ProjectDB {
  static final ProjectDB instance = ProjectDB._init();

  static Database _database;

  ProjectDB._init();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDB('credentials.db');

    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final emailType = 'TEXT NOT NULL';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE $tableCredentials(
  ${CredentialFields.id} $idType,
  ${CredentialFields.email} $emailType,
  ${CredentialFields.name} $textType,
  ${CredentialFields.number} $textType,
  ${CredentialFields.password} $textType
)
    ''');

    await db.execute('''
CREATE TABLE $tableTransaction(
  ${TransactionFields.id} $idType,
  ${TransactionFields.accountId} $textType,
  ${TransactionFields.description} $textType,
  ${TransactionFields.crAmount} $textType,
  ${TransactionFields.drAmount} $textType,
  ${TransactionFields.date} $textType
)
    ''');
  }

  Future<SignUpModel> create(SignUpModel credentials) async {
    final db = await instance.database;

    final id = await db.insert(tableCredentials, credentials.toJson());

    return credentials.copy(id: id);
  }

  Future<TransactionsModel> createTransaction(TransactionsModel transaction) async {
    final db = await instance.database;

    final id = await db.insert(tableTransaction, transaction.toJson());

    return transaction.copy(id: id);
  }

  Future<SignUpModel> readCredentials(String email, String password) async {
    final db = await instance.database;

    final maps = await db.query(
      tableCredentials,
      columns: CredentialFields.values,
      where:
          '${CredentialFields.email} = ? AND ${CredentialFields.password} = ?',
      whereArgs: [email, password],
    );

    if (maps.isNotEmpty) {
      return SignUpModel.fromJson(maps.first);
    } else {
      throw Exception('Account associated with $email not found');
    }
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
