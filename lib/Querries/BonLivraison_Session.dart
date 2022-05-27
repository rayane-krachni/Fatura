
import 'package:flutter/cupertino.dart';
import 'package:freelance/Model/BonLivraisson_Model.dart';
import 'package:freelance/Querries/AppConfigue.dart';



class BonLivraisonSession{
  static SqlDb mysqldb =SqlDb();
  static  Future<int> Addbills(int id_fournisseur,int id_client,int id_facture,String date,String transport ,String matricule,String chauffeur,String mode_pay) async{
    print ("response +++++++");
    int response = await mysqldb.insertDatabase("INSERT INTO 'bon_livraison' (id_fournisseur,id_client,id_facture,date,transport,matricule,chauffeur,mode_pay) VALUES (?,?,?,?,?,?,?,?)",[id_fournisseur,id_client,id_facture,date,transport,matricule,chauffeur,mode_pay]);
    print ("response ====");
    print ("response $response");
    return response;

  }

  static Future <List<BonLivraison_Model>>   getbills() async {
    List<Map> response= await mysqldb.readDatabase("SELECT * FROM 'bon_livraison'" );
    List<BonLivraison_Model> list = (response as List).map((c) => BonLivraison_Model.fromMap(c)).toList();
    return list;

  }



}