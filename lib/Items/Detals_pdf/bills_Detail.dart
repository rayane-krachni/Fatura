

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:freelance/Envoices/Bills/bills_with_logo.dart';
import 'package:freelance/Envoices/Bills/bills_without_logo.dart';
import 'package:freelance/Envoices/PdfApi.dart';
import 'package:freelance/Envoices/envoices/PdfEnvoiceWithlogo.dart';
import 'package:freelance/Model/BonLivraisson_Model.dart';
import 'package:freelance/Model/Client/Client_Model.dart';
import 'package:freelance/Model/Fcature/Facture_Model.dart';
import 'package:freelance/Model/Fournisseur/Fournisseur_Model.dart';
import 'package:freelance/Model/Produit/Produit_Model.dart';
import 'package:freelance/Providers/Facture_Management.dart';
import 'package:freelance/Querries/Client_session.dart';
import 'package:freelance/Querries/Facture_Session.dart';
import 'package:freelance/Querries/Fournisseur_Session.dart';
import 'package:freelance/Querries/Produit_Session.dart';
import 'package:freelance/widgets/ritch_text.dart';
import 'package:provider/provider.dart';

import '../../Envoices/envoices/PdfEnvoiceApi.dart';

class BillsDetal extends StatefulWidget {
  BonLivraison_Model bill;
   BillsDetal({Key? key,required this.bill}) : super(key: key);

  @override
  _BillsDetalState createState() => _BillsDetalState();
}

class _BillsDetalState extends State<BillsDetal> {
  List<Facture_Model> invoice=List<Facture_Model>.empty(growable: true);
  Facture_Manage manager=Facture_Manage();
  void getEnvoice() async{
    List<Facture_Model> map = await FactureSession.getAllDataByid(widget.bill.id_facture!);
    invoice=map;
     print('list are ${invoice[0].id_produit!}');
     invoiceproduitlist=getproduitlist(invoice[0].id_produit!);
    print('___ $invoiceproduitlist');
    getProduit(invoiceproduitlist);
    //getproduitlist();
    print('333 ${!manager.loadcproduitpdf}');
    getproduitquantitelist(invoice[0].quantite!);
   // manager.loadfournisspdf=true;
    print('facture are ${invoice[0]}');
  }

  List<Client_Model>  invoiceclient =List<Client_Model>.empty(growable: true);
  List<Fournisseur_Model> invoicebill=List<Fournisseur_Model>.empty(growable: true);
  List<Produit_Model> invoiceproduit=List<Produit_Model>.empty(growable: true);
  List<String> invoiceproduitlist=List<String>.empty(growable: true);
  List<String> invoiceqt=List<String>.empty(growable: true);
  List<String>? invoiceunit;
  void getFournisseur() async{
    List<Fournisseur_Model> map = await FournisseurSession.getfournisseurbyid(widget.bill.id_fournisseur!);
    invoicebill=map;
    manager.loadfournisspdf=true;
    print('envoice are $invoicebill');
  }
  void getlistclient() async
  {
    List<Client_Model> myclientlist= await ClientSession.getClientbyid(widget.bill.id_client!);

    invoiceclient=myclientlist;
    manager.loadclientpdf=true;

  }
  List<String> getproduitlist(String list)
  {
    print('list $list');
    List<String> ids =new List<String>.empty(growable: true);

   for(int i =0 ; i < list.length ; i++ )
    {print('list ii ${list[i]}');

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
  void initState() {
    getEnvoice();
    getFournisseur();
    print('111 ${!manager.loadfournisspdf}');
    getlistclient();
    print('222 ${!manager.loadclientpdf}');

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
                  child:(invoiceclient.isEmpty || invoicebill.isEmpty || invoiceproduit.isEmpty || invoiceqt.isEmpty ) ?

                  Center(
                      child: Column(
                        children: [
                          Center(
                            child: SpinKitPouringHourGlassRefined  (
                              color: Colors.teal,
                              size: 50.0,
                              duration: const Duration(milliseconds: 12000),

                            ),
                          ),
                          Icon(Icons.search_off_rounded),
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

                          Ritch_Text(title: 'Les information de Bon de livraison ',detail:'' ,icon: Icons.person),

                          Ritch_Text(title: 'Moy de Transport ',detail:widget.bill.transport! ,icon: Icons.person),

                          Ritch_Text(title: 'Nom de chaufeur ',detail:widget.bill.chauffeur!.toString() ,icon: Icons.person),
                          Ritch_Text(title: 'Mode De Payment ',detail:widget.bill.mode_pay! ,icon: Icons.person),

                          Ritch_Text(title: 'Les information de client ',detail:'' ,icon: Icons.person),

                          Ritch_Text(title: 'Nom ',detail:invoiceclient[0].fullname! ,icon: Icons.person),

                          Ritch_Text(title: 'Phone ',detail:invoiceclient[0].telephone!.toString() ,icon: Icons.person),
                          Ritch_Text(title: 'Address ',detail:invoiceclient[0].address! ,icon: Icons.person),


                          Ritch_Text(title: 'Les information de Fournisseur ',detail:'' ,icon: Icons.person),

                          Ritch_Text(title: 'Nom ',detail:invoicebill[0].fullname! ,icon: Icons.person),

                          Ritch_Text(title: 'Phone ',detail:invoicebill[0].telephone!.toString() ,icon: Icons.person),
                          Ritch_Text(title: 'Address ',detail:invoicebill[0].address! ,icon: Icons.person),
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

                                    final pdfFile= await  PdfBillApi.generate(invoice[0],invoiceclient[0],invoicebill[0],invoiceproduit,invoiceqt,widget.bill );
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

                                    final pdfFile= await  PdfBillsWithoutLogoApi.generate(invoice[0],invoiceclient[0],invoicebill[0],invoiceproduit,invoiceqt,widget.bill );
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

