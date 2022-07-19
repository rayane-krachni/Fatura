
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../Model/Client/Client_Model.dart';
import '../Model/Fcature/Facture_Model.dart';
import '../Model/Fournisseur/Fournisseur_Model.dart';
import '../Model/Produit/Produit_Model.dart';
import '../Providers/Facture_Management.dart';
import '../Querries/Client_session.dart';
import '../Querries/Fournisseur_Session.dart';
import '../Querries/Produit_Session.dart';
import '../widget/PdfApi.dart';
import '../widget/PdfEnvoiceApi.dart';

class Calculating extends StatefulWidget {
  Facture_Model? invoice;
  Calculating({Key? key,this.invoice}) : super(key: key);

  @override
  _CalculatingState createState() => _CalculatingState();
}


class _CalculatingState extends State<Calculating> {
  Facture_Manage manager=Facture_Manage();
  List<Client_Model>  invoiceclient =List<Client_Model>.empty(growable: true);
  List<Fournisseur_Model> invoicefournisseur=List<Fournisseur_Model>.empty(growable: true);
  List<Produit_Model> invoiceproduit=List<Produit_Model>.empty(growable: true);
  List<String> invoiceproduitlist=List<String>.empty(growable: true);
  List<String> invoiceqt=List<String>.empty(growable: true);
  List<String>? invoiceunit;
  void getFournisseur() async{
    List<Fournisseur_Model> map = await FournisseurSession.getfournisseurbyid(widget.invoice!.id_fournisseur!);
    invoicefournisseur=map;
    manager.loadfournisspdf=true;
    print('fff$invoicefournisseur');
  }
  void getlistclient() async
  {
    List<Client_Model> myclientlist= await ClientSession.getClientbyid(widget.invoice!.id_client!);
    print('mmm $myclientlist');
    invoiceclient=myclientlist;
    manager.loadclientpdf=true;
    print('ggg ${invoiceclient}');
  }
  List<String> getproduitlist(String list)
  {
    List<String> ids =new List<String>.empty(growable: true);
    print('111111 $list');
    for(int i =0 ; i < list.length ; i++ )
    {
      print('22222 $list');
      if(list[i]!=';')
      {
        ids.add(list[i]);
      }
    }
    print("ids$ids");

    return ids;

  }

  void getProduit(List<String> produitsids) async{
    for(int i =0 ; i < produitsids.length ; i++ )
    {
      print('idf ${produitsids[i]}');
      List<Produit_Model> myproduitslist= await ProduitSession.GetAllProductsbyid(int.parse(produitsids[i]));
      print('hhhhh ${myproduitslist}');
      invoiceproduit.add(myproduitslist[0]);
      //List<Client_Model> mmap = await (response as List).map((c) => Client_Model.fromMap(c)).toList();

    }
    manager.loadcproduitpdf=true;
  }
  void getproduitquantitelist(String quantite)
  {
    String qte='';
    //List<String> quant =new List<String>.empty(growable: true);
    print('rtrt $quantite');
    for(int i =0 ; i < quantite.length ; i++ )
    {
      print('c1c1 ${quantite[i]}');
      if(quantite[i]!=';') {
        print('c2c1 ${quantite[i]}');
        qte = qte + quantite[i];
        print('c3c1 ${quantite[i]}');
      }
      else{
        print('c4c1 ${quantite[i]}');
        invoiceqt.add(qte);
        print('c5c1 ${invoiceqt}');
        print("C2C2$invoiceqt");
        qte="";

      }


    }




  }
  @override
  void initState()  {
    getFournisseur();
    print('111 ${!manager.loadfournisspdf}');
    getlistclient();
    print('222 ${!manager.loadclientpdf}');
    invoiceproduitlist=getproduitlist(widget.invoice!.id_produit!);
    print('___ $invoiceproduitlist');
    getProduit(invoiceproduitlist);
    //getproduitlist();
    print('333 ${!manager.loadcproduitpdf}');
    getproduitquantitelist(widget.invoice!.quantite!);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: manager,
      child: Consumer<Facture_Manage>(
        builder: (context,manag,_)
        {
         return  Scaffold(
            appBar: AppBar(
              title: const Center(child: Text('Invoice Information')),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child:(manag.loadclientpdf || manag.loadfournisspdf || manag.loadcproduitpdf) ?
                Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [BoxShadow(
                        blurRadius:5 ,
                        color: Colors.grey.withOpacity(0.2),
                        offset: Offset(0,3)
                    )]
                ),
                 child:(invoiceclient.isEmpty || invoicefournisseur.isEmpty || invoiceproduit.isEmpty || invoiceqt.isEmpty ) ? Text('emptyy')
                 :SizedBox(
                   width: MediaQuery.of(context).size.width,
                   child: SingleChildScrollView(
                     child: Column(
                      children: [
                        Text(widget.invoice!.num_facture!.toString()),
                        Text('Client'),
                        Text("Full Name: ${invoiceclient[0].fullname!}"),
                        Text("Tel Phone : ${invoiceclient[0].telephone!}"),
                        Text("Address: ${invoiceclient[0].address!}"),
                        Text('Fournisseur'),
                        Text("Full Name: ${invoicefournisseur[0].fullname!}"),
                        Text("Tel Phone : ${invoicefournisseur[0].telephone!}"),
                        Text("Address: ${invoicefournisseur[0].address!}"),

                        Text('Produit'),
                        SizedBox(
                          child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: invoiceproduit.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(children:[
                              Text("Address: ${invoiceqt[index]}"),
                              SizedBox(width: 30,),
                              Text(invoiceproduit[index].tva.toString()),
                              SizedBox(width: 30,),
                              Text(invoiceproduit[index].name!)]);
                          },


                        ),) ,
                      // Text(invoiceproduitlist.length.toString()),
                        Text(invoiceproduit.length.toString()),
                      //  Text(invoiceqt!.first),
                       // Text(invoicefournisseur[0].fullname!),

                        SizedBox(
                          child: RaisedButton(
                            onPressed: () async{

                              final pdfFile= await  PdfEnvoiceApi.generate(widget.invoice!,invoiceclient[0],invoicefournisseur[0],invoiceproduit,invoiceqt );
                              await PdfApi.openFile(pdfFile);
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => FactureDetailExported(facture: widget.facture! )))

                            },
                            child: Text("Export Pdf") ,
                          ),
                        )
                      //  Text(invoiceunit!.first),

                      ],
                ),
                   ),
                 )
              ):Text('waair'),
            ),
          );
        },

      ),
    );
  }
}


