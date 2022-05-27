import 'package:freelance/Model/Fcature/Facture_Bills.dart';
import 'package:freelance/Model/Fcature/Facture_Model.dart';
import 'package:freelance/Querries/AppConfigue.dart';



class FactureSession{
    static SqlDb mysqldb =SqlDb();
    static  Future<int> Addinvoice(int id_fournisseur,int id_client,int num_facture,String date,String id_produit,String quantite,String remise,unite) async{
    print ("response +++++++$id_fournisseur $id_client $num_facture}");
    int response = await mysqldb.insertDatabase("INSERT INTO 'envoice' (id_fournisseur,id_client,num_facture,date,id_produit,quantite,remise,unite) VALUES (?,?,?,?,?,?,?,?)",[id_fournisseur,id_client,num_facture,date,id_produit,quantite,remise,unite]);
    print ("response ==== $response");
    return response;

  }

    static Future<List<FactureBills_Model>>   getfactureids() async {
        var response= await mysqldb.readDatabase('SELECT "id","num_facture"  FROM "envoice" ' );
        List<FactureBills_Model> information = (response as List).map((c) => FactureBills_Model.fromMap(c)).toList();
        print("msg msg from session");
        return information;
    }

    static Future<List<Facture_Model>> getAllData() async {
        var response = await mysqldb.readDatabase('SELECT * FROM "envoice" ' );
        List<Facture_Model> list = (response as List).map((c) => Facture_Model.fromMap(c)).toList();
        print("lmessage1 from session");
        return list;
    }



}