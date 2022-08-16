
import 'dart:ffi';

import 'package:flutter/services.dart';
import 'package:freelance/Model/Client/Client_Facture.dart';
import 'package:freelance/Model/Client/Client_Model.dart';
import 'package:freelance/Querries/AppConfigue.dart';

import '../Providers/Facture_Management.dart';



class ClientSession{
  static SqlDb mysqldb =SqlDb();
  static Facture_Manage manager=Facture_Manage();
  static  Future<int> AddClient(String name,String Address,String willaya,String activite,String nic,String nif,String art,String rc,int phone,) async{
    int response = await mysqldb.insertDatabase("INSERT INTO 'client' (fullname,address,willaya,activite,nif,nic,art,rc,telephone) VALUES (?,?,?,?,?,?,?,?,?)",[name,Address,willaya,activite,nif,nic,art,rc,phone]);
    return response;

  }
  static  Future<int> EditClient(int id,String name,String Address,String willaya,String activite,String nic,String nif,String art,String rc,int phone,) async{
    int response = await mysqldb.updateDatabase(
        "UPDATE 'client' SET fullname = ?,address=? ,willaya=?,activite=?,nif=?,nic=?,art=?,rc=?,telephone=? WHERE id = ?",[name,Address,willaya,activite,nif,nic,art,rc,phone,id]);

    return response;

  }

  static  Future<int> DeleteClient(int idClient) async{
    int response = await mysqldb.deleteDatabase('DELETE  FROM "client" WHERE "id"=$idClient');

    return response;

  }

    static Future<List<ClientFcture_Model>>   getClientName() async {
    var response= await mysqldb.readDatabase('SELECT "id","fullname"  FROM "client" ' );
    List<ClientFcture_Model> information = (response as List).map((c) => ClientFcture_Model.fromMap(c)).toList();

    return information;
    }


  static Future<List<Client_Model>>   getClientbyid(int id) async {
    var response= await mysqldb.readDatabase('SELECT *  FROM "client" WHERE "id"=$id');
    List<Client_Model> informationbyid = (response as List).map((c) => Client_Model.fromMap(c)).toList();

    return informationbyid;
  }
  static Future<List<Client_Model>> getAllData() async {
    var response = await mysqldb.readDatabase('SELECT * FROM "client" ' );
    List<Client_Model> list = (response as List).map((c) => Client_Model.fromMap(c)).toList();

    return list;
  }





}