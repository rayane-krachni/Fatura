
import 'dart:async';
import 'dart:io' as io;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class  SqlDb{
  static Database? _db;

  Future<Database?> get db async{
    if(_db==null)
    {
      _db= await InitialDb();
      return _db;
    }
    else{
      return _db;
    }
  }




  InitialDb() async{
        String databasepath= await getDatabasesPath();
        String path= join(databasepath,'Facture.db');
        Database mydb= await openDatabase(path,onCreate: _onCreate,version: 1,onUpgrade: _OnUpgrade);
        return mydb;
      }

  FutureOr<void> _OnUpgrade(Database db, int oldVersion, int newVersion) {
    //newVersion=newVersion+1;
    print('on upgrade ');
  }

  _onCreate(Database db, int version) async{
    print('on create ');
    db.execute('''CREATE TABLE User (
    "id" INTEGER PRIMARY KEY, 
    "full_name" TEXT,
    "phone" INTEGER,
    "password" TEXT
   
  
    )''');
  
  db.execute('''CREATE TABLE client (
      "id" INTEGER PRIMARY KEY AUTOINCREMENT, 
      "fullname" TEXT,
      "address" TEXT,
      "willaya" TEXT,
      "activite" TEXT,
      "nif" TEXT , 
      "nic" TEXT,
      "art" TEXT, 
      "rc" TEXT, 
      "telephone" INTEGER
      )''');
  db.execute('''CREATE TABLE fournisseur (
      "id" INTEGER PRIMARY KEY AUTOINCREMENT, 
      "fullname" TEXT,
      "company" TEXT,
      "address" TEXT,
      "willaya" TEXT,
      "activite" TEXT,
      "nif" TEXT , 
      "nic" TEXT,
      "art" TEXT, 
      "rc" TEXT, 
      "telephone" INTEGER
      )''');
  db.execute('''CREATE TABLE produit (
      "id" INTEGER PRIMARY KEY AUTOINCREMENT, 
      "name" TEXT,
      "tva" INTEGER,
      "prix" DOUBLE,
      "code" TEXT,
      "stock" INTEGER
      )''');
  db.execute('''CREATE TABLE bon_livraison (
      "id" INTEGER PRIMARY KEY AUTOINCREMENT, 
      "id_fournisseur" INTEGER,
      "id_client" INTEGER,
      "id_facture" INTEGER,
      "date" TEXT,
      "transport" TEXT,
      "matricule" TEXT,
      "chauffeur" TEXT,
      "mode_pay" TEXT
      )''');

  db.execute('''CREATE TABLE envoice (
      "id" INTEGER PRIMARY KEY AUTOINCREMENT, 
      "id_fournisseur" INTEGER,
      "id_client" INTEGER,
      "num_facture" TEXT  ,
      "date" TEXT,
      "id_produit" TEXT,
      "quantite" TEXT,
      "remise" TEXT,
      "unite" TEXT,
      "timber" INTEGER
      )''');




  }

  readDatabase(String sql) async {
    Database? mydb= await db;
    List<Map> response=await mydb!.rawQuery(sql);
    return response;

  }
  insertDatabase(String sql, List<Object> list) async {
    Database? mydb= await db;
    int response= await mydb!.rawInsert(sql,list);
    return response;

  }
  updateDatabase(String sql) async {
    Database? mydb= await db;
    int response=await mydb!.rawUpdate(sql);
    return response;

  }
  deleteDatabase(String sql) async {
    Database? mydb= await db;
    int response=await mydb!.rawDelete(sql);
    return response;

  }


}