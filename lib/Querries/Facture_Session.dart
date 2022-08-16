import 'package:freelance/Model/Fcature/Facture_Bills.dart';
import 'package:freelance/Model/Fcature/Facture_Model.dart';
import 'package:freelance/Querries/AppConfigue.dart';



class FactureSession{
  static SqlDb mysqldb =SqlDb();
  static  Future<int> Addinvoice(int id_fournisseur,int id_client,String num_facture,String date,String id_produit,String quantite,String remise,String unite,int timber) async{
    
    int response = await mysqldb.insertDatabase("INSERT INTO 'envoice' (id_fournisseur,id_client,num_facture,date,id_produit,quantite,remise,unite,timber) VALUES (?,?,?,?,?,?,?,?,?)",[id_fournisseur,id_client,num_facture,date,id_produit,quantite,remise,unite,timber]);

    return response;

  }

  static  Future<int> DeleteInvoice(int idInvoice) async{
    int response = await mysqldb.deleteDatabase('DELETE  FROM "envoice" WHERE "id"=$idInvoice');

    return response;

  }

  static Future<List<FactureBills_Model>>   getfactureids() async {
    var response= await mysqldb.readDatabase('SELECT "id","num_facture"  FROM "envoice" ' );
    List<FactureBills_Model> information = (response as List).map((c) => FactureBills_Model.fromMap(c)).toList();

    return information;
  }

  static Future<List<Facture_Model>> getAllData() async {
    var response = await mysqldb.readDatabase('SELECT * FROM "envoice" ' );
    List<Facture_Model> list = (response as List).map((c) => Facture_Model.fromMap(c)).toList();

    return list;
  }

  static Future<List<Facture_Model>> getAllDataByid(int id) async {
    var response = await mysqldb.readDatabase('SELECT * FROM "envoice" WHERE "id"=$id' );
    List<Facture_Model> list = (response as List).map((c) => Facture_Model.fromMap(c)).toList();

    return list;
  }



}