import 'package:freelance/Model/Fcature/Facture_Model.dart';
import 'package:freelance/Model/Fournisseur/Founisseur_Facture.dart';
import 'package:freelance/Model/Fournisseur/Fournisseur_Model.dart';
import 'package:freelance/Querries/AppConfigue.dart';
import 'package:freelance/Screens/Fournisseur.dart';

import '../Providers/Facture_Management.dart';



class FournisseurSession{
  static SqlDb mysqldb =SqlDb();
  static Facture_Manage manager=Facture_Manage();
  static  Future<int> AddFournisseur(String name,String company,String Address,String willaya,String activite,String nif,String nic,String art,String rc,int phone,) async{
    print ("response +++++++");
    int response = await mysqldb.insertDatabase("INSERT INTO 'fournisseur' (fullname,company,address,willaya,activite,nif,nic,art,rc,telephone) VALUES (?,?,?,?,?,?,?,?,?,?)",[name,company,Address,willaya,activite,nif,nic,art,rc,phone]);
    print ("response ====");
    print ("response $response");
    return response;

  }
    static  Future<int> EditFournisseur(int id,String name,String company,String Address,String willaya,String activite,String nic,String nif,String art,String rc,int phone,) async{
    int response = await mysqldb.updateDatabase("UPDATE 'fournisseur' SET fullname = ?,address=?,company=?,willaya=?,activite=?,nif=?,nic=?,art=?,rc=?,telephone=? WHERE id = ?",[name,Address,company,willaya,activite,nif,nic,art,rc,phone,id]);
    return response;

  }


  static Future<List<FournisseurFcture_Model>> getFournisseursName() async {
    var response= await mysqldb.readDatabase('SELECT "id","fullname"  FROM "fournisseur" ' );
    List<FournisseurFcture_Model> information = (response as List).map((c) => FournisseurFcture_Model.fromMap(c)).toList();
    print("msg msg from session");
    return information;
  }

  static  Future<int> DeleteFournisseur(int idFournisseur) async{
    int response = await mysqldb.deleteDatabase('DELETE  FROM "fournisseur" WHERE "id"=$idFournisseur');
    print ("delte four response ====");
    print ("response $response");
    return response;

  }
  static Future<List<Fournisseur_Model>>   getfournisseurbyid(int id) async {
    var response= await mysqldb.readDatabase('SELECT *  FROM "fournisseur" WHERE "id"=$id ' );
    List<Fournisseur_Model> informationbyid = (response as List).map((c) => Fournisseur_Model.fromMap(c)).toList();

    print("msg msg from session get fournisseur by id");
    return informationbyid;
  }

  static Future<List<Fournisseur_Model>> getAll() async {
    var response = await mysqldb.readDatabase('SELECT * FROM "fournisseur" ' );
    List<Fournisseur_Model> list = (response as List).map((c) => Fournisseur_Model.fromMap(c)).toList();
    print("lmessage1 from session");
    return list;
  }



}