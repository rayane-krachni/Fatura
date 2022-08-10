import 'package:freelance/Model/Produit/Produit_Facture.dart';
import 'package:freelance/Model/Produit/Produit_Model.dart';
import 'package:freelance/Querries/AppConfigue.dart';
import 'package:freelance/Screens/Editting/produit_edit.dart';



class ProduitSession{
  static SqlDb mysqldb =SqlDb();
  static  Future<int> Addproduit(String name,int tva,double prix,String code,int stock) async{
    print ("response +++++++");
    int response = await mysqldb.insertDatabase("INSERT INTO 'produit' (name,tva,prix,code,stock) VALUES (?,?,?,?,?)",[name,tva,prix,code,stock]);
    print ("response ====");
    print ("response $response");
    return response;

  }

  static  Future<int> Edit_Produit(int id,String name,int tva,double prix,String code,int stock) async{
    int response = await mysqldb.updateDatabase("UPDATE 'produit' SET name = ?,tva=?,prix=?,code=?,stock=? WHERE id = ?",[name,tva,prix,code,stock,id]);
    return response;

  }
  static  Future<int> DeleteProduit(int idProduit) async{
    int response = await mysqldb.deleteDatabase('DELETE  FROM "produit" WHERE "id"=$idProduit');
    print ("delte prod response ====");
    print ("response $response");
    return response;

  }

  static Future<List<Produit_Model>> GetAllProducts() async{

    var response= await mysqldb.readDatabase('SELECT * FROM "produit"');

    List<Produit_Model> listProduit=(response as List).map((e) => Produit_Model.formMap(e)).toList();

    return listProduit;
  }


  static Future<List<Produit_Model>> GetAllProductsbyid(int id ) async{

    var response= await mysqldb.readDatabase('SELECT * FROM "produit" WHERE "id"=$id ');

    List<Produit_Model> listProduitid=(response as List).map((e) => Produit_Model.formMap(e)).toList();
    print("msg msg from produitttsession");
    return listProduitid;
  }



  static Future<List<ProduitFacture_Model>>   getProduitName() async {
    var response2= await mysqldb.readDatabase('SELECT "id","name"  FROM "produit" ' );
    List<ProduitFacture_Model> information = (response2 as List).map((c) => ProduitFacture_Model.fromMap(c)).toList();
    print("msg msg from session");
    return information;
  }




}