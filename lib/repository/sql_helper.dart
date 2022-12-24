import 'dart:async';
import 'package:finalproject/model/card_item_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlHelper{

  static Database? _db;

  Future<Database> get db async{
    if(_db != null){
      return _db!;
    }
    _db = await initDatabase();
    return _db!;
  }

  initDatabase() async {
    String documentsDirectory = await getDatabasesPath();
    String path = join(documentsDirectory, "Cart.db");
    var database = await openDatabase(path, version: 1, onCreate: _onCreate);
    return database;
  }
  _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE Cart (
    'name' TEXT NOT NULL,
    'image' TEXT NOT NULL,
    'price' TEXT NOT NULL,
    'quantity' INTEGER NOT NULL,
    'id' TEXT NOT NULL
    )
    ''');
    print('Table Created');
  }

  insertData(CartItemModel cartItemModel) async {
    var dbClient = await db;
    await dbClient.insert('Cart', cartItemModel.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<CartItemModel>> getAllItems() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query('Cart');
    List<CartItemModel> cartItemModel = maps.isNotEmpty
        ? maps.map((e) => CartItemModel.fromJson(e)).toList() : [];
    return cartItemModel;
  }

  updateData(CartItemModel cartItemModel) async {
    var dbClient = await db;
    await dbClient.update('Cart', cartItemModel.toJson(), where: 'id = ?', whereArgs: [cartItemModel.id]);
  }

  deleteData(CartItemModel cartItemModel) async {
    var dbClient = await db;
    await dbClient.delete('Cart', where: 'id = ?', whereArgs: [cartItemModel.id]);
  }

  deleteAllData() async {
    var dbClient = await db;
    await dbClient.delete('Cart');
  }

  //
  // readData(String table, {bool? distinct, List<String>? columns, String? where, List<Object?>? whereArgs, String? groupBy, String? having, String? orderBy, int? limit, int? offset}) async {
  //   Database? dbClient = await db;
  //   List<Map> list = await dbClient.query(table, distinct: distinct, columns: columns, where: where, whereArgs: whereArgs, groupBy: groupBy, having: having, orderBy: orderBy, limit: limit, offset: offset);
  //   return list;
  // }
  //
  // readDataSql(String sql) async {
  //   Database? dbClient = await db;
  //   List<Map> list = await dbClient.rawQuery(sql);
  //   return list;
  // }
  //
  // insertData(String table, Map<String, dynamic> data) async {
  //   Database? dbClient = await db;
  //   var result = await dbClient.insert(table, data);
  //   return result;
  // }
  //
  // insertDataSql(String sql) async {
  //   Database? dbClient = await db;
  //   int res = await dbClient.rawInsert(sql);
  //   return res;
  // }
  //
  // updateData(String table, Map<String, Object?> values, {String? where, List<Object?>? whereArgs, ConflictAlgorithm? conflictAlgorithm}) async {
  //   Database? dbClient = await db;
  //   var result = await dbClient.update(table, values, where: where, whereArgs: whereArgs, conflictAlgorithm: conflictAlgorithm);
  //   return result;
  // }
  //
  // updateDataSql(String sql) async {
  //   Database? dbClient = await db;
  //   int res = await dbClient.rawUpdate(sql);
  //   return res;
  // }
  //
  //
  // deleteData(String table, {String? where, List<Object?>? whereArgs}) async {
  //   Database? dbClient = await db;
  //   int res = await dbClient.delete(table, where: where, whereArgs: whereArgs);
  //   return res;
  // }
  //
  // deleteDataSql(String sql) async {
  //   Database? dbClient = await db;
  //   int res = await dbClient.rawDelete(sql);
  //   return res;
  // }

}