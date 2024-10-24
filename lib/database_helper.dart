import 'dart:async';
import 'package:path/path.dart';

import 'sensor_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  static const String _databaseName = 'sensors.db';
  static const String _tableName = 'sensors';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async{
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
    path, 
    // Se o banco de dados ja existe e você altera a versão para uma superior (por exemplo, de 1 para 2), o método onUpgrade é chamado, permitindo que voce escreva lógica de migração para atualizar o esquema do banco de dados sem perder.
    version: 1, 
    // _onCreate será executado caso nao exista as tabelas criadas
    onCreate: _onCreate,
    
    );
  }

  Future<void> _onCreate(Database db, int version) async{
    await db.execute('''
      CREATE TABLE $_tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        tipo TEXT,
        mac_address TEXT, 
        latitude REAL, 
        longitude REAL, 
        localizacao TEXT NOT NULL,
        responsavel TEXT, 
        unidade_medida TEXT, 
        status_operacional INTEGER,
        observacao TEXT
      )
    ''');
  }

  Future<int> insertSensor(Map<String, dynamic> sensorData) async{
    Database db = await database;
    return await db.insert(_tableName, sensorData);
  }

  Future<int> updateSensor(Map<String, dynamic> sensorData, int id) async{
    Database db = await database;
    return await db.update(
      _tableName, 
      sensorData,
      where: 'id = ?',
      whereArgs: [id],
    );
  }



  Future<int> deleteSensor(int id) async{
    Database db = await database;
    return await db.delete(     
      _tableName, 
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Sensor>> getAllSensors() async{
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    return List.generate(maps.length, (i){
      return Sensor.fromMap(maps[i]);
    });
  }

  Future<Sensor?> getSensorById(int id) async{
    Database db = await database;
    List<Map<String, dynamic>> result = await db.query(
      _tableName, 
      where: 'id = ?',
      whereArgs: [id],
    );
    if (result.isNotEmpty){
      return Sensor.fromMap(result.first);
    }
    return null;
  }
 }