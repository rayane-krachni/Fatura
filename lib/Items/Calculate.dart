
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:freelance/Envoices/PdfApi.dart';
import 'package:freelance/Envoices/envoices/PdfEnvoiceApi.dart';
import 'package:freelance/Envoices/envoices/PdfEnvoiceWithlogo.dart';
import 'package:freelance/Theme/Theme.dart';
import 'package:freelance/widgets/ritch_text.dart';
import 'package:provider/provider.dart';
import '../Model/Client/Client_Model.dart';
import '../Model/Fcature/Facture_Model.dart';
import '../Model/Fournisseur/Fournisseur_Model.dart';
import '../Model/Produit/Produit_Model.dart';
import '../Providers/Facture_Management.dart';
import '../Querries/Client_session.dart';
import '../Querries/Fournisseur_Session.dart';
import '../Querries/Produit_Session.dart';


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

    invoiceclient=myclientlist;
    manager.loadclientpdf=true;

  }
  List<String> getproduitlist(String list)
  {
    List<String> ids =new List<String>.empty(growable: true);

    for(int i =0 ; i < list.length ; i++ )
    {

      if(list[i]!=';')
      {
        ids.add(list[i]);
      }
    }


    return ids;

  }

  void getProduit(List<String> produitsids) async{
    for(int i =0 ; i < produitsids.length ; i++ )
    {

      List<Produit_Model> myproduitslist= await ProduitSession.GetAllProductsbyid(int.parse(produitsids[i]));
      invoiceproduit.add(myproduitslist[0]);
      //List<Client_Model> mmap = await (response as List).map((c) => Client_Model.fromMap(c)).toList();

    }
    manager.loadcproduitpdf=true;
  }
  void getproduitquantitelist(String quantite)
  {
    String qte='';

    for(int i =0 ; i < quantite.length ; i++ )
    {
      if(quantite[i]!=';') {
        qte = qte + quantite[i];
      }
      else{
        invoiceqt.add(qte);
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
                 child:(invoiceclient.isEmpty || invoicefournisseur.isEmpty || invoiceproduit.isEmpty || invoiceqt.isEmpty ) ?

                 Center(
                     child: Column(
                       mainAxisAlignment:  MainAxisAlignment.center,
                       children:  const [
                         Center(
                           child: SpinKitPouringHourGlassRefined  (
                             color: Colors.teal,
                             size: 50.0,
                             duration: Duration(milliseconds: 12000),

                           ),
                         ),
                         
                         Center(child: Text('Ya Des information sont null Ils')),
                         Center(child: Text('Peuvent être supprimés ')),
                       ],
                     ))
                 :SizedBox(
                   width: double.maxFinite,
                   child: SingleChildScrollView(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        Ritch_Text(title: 'Les information de client ',detail:'' ,icon: Icons.person),

                        Ritch_Text(title: 'Nom ',detail:invoiceclient[0].fullname! ,icon: Icons.person),

                        Ritch_Text(title: 'Phone ',detail:invoiceclient[0].telephone!.toString() ,icon: Icons.person),
                        Ritch_Text(title: 'Address ',detail:invoiceclient[0].address! ,icon: Icons.person),


                        Ritch_Text(title: 'Les information de Fournisseur ',detail:'' ,icon: Icons.person),

                        Ritch_Text(title: 'Nom ',detail:invoicefournisseur[0].fullname! ,icon: Icons.person),

                        Ritch_Text(title: 'Phone ',detail:invoicefournisseur[0].telephone!.toString() ,icon: Icons.person),
                        Ritch_Text(title: 'Address ',detail:invoicefournisseur[0].address! ,icon: Icons.person),
                        Ritch_Text(title: 'Les information des Produit ',detail:'' ,icon: Icons.person),

                        SizedBox(
                          child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: invoiceproduit.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(children:[
                              Text(invoiceproduit[index].name!),
                              SizedBox(width: 10,),
                              Text("Qte: ${invoiceqt[index]}"),
                              SizedBox(width: 10,),
                              Text("tva: ${invoiceproduit[index].tva.toString()} %"),

                              ]);
                          },


                        ),) ,


                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            SizedBox(
                              width: 150,
                              child: RaisedButton(
                                onPressed: () async{

                                  final pdfFile= await  PdfEnvoiceApi.generate(widget.invoice!,invoiceclient[0],invoicefournisseur[0],invoiceproduit,invoiceqt );
                                  await PdfApi.openFile(pdfFile);
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => FactureDetailExported(facture: widget.facture! )))

                                },
                                color: Colors.teal,
                                child: const Text("Exporter Avec Un Logo",style: TextStyle(color: Colors.white,fontSize: 12),) ,
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              child: RaisedButton(

                                onPressed: () async{

                                  final pdfFile= await  PdfEnvoiceWithoutLogoApi.generate(widget.invoice!,invoiceclient[0],invoicefournisseur[0],invoiceproduit,invoiceqt );
                                  await PdfApi.openFile(pdfFile);
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => FactureDetailExported(facture: widget.facture! )))

                                },
                                color: Colors.teal,
                                child: Text("Exporter Sans Un Logo",style: TextStyle(color: Colors.white,fontSize: 12)) ,
                              ),
                            ),
                          ],
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


