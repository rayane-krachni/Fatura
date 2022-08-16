import 'package:flutter/material.dart';
import 'package:freelance/Items/Detals_pdf/Calculate.dart';
import 'package:freelance/Model/Fcature/Facture_Model.dart';
import 'package:freelance/Providers/Facture_Management.dart';
import 'package:freelance/Querries/Facture_Session.dart';
import 'package:freelance/Screens/HomePage.dart';
import 'package:freelance/Theme/Theme.dart';
import 'package:freelance/widgets/Success_Diag.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../Model/Client/Client_Model.dart';
import '../Model/Fournisseur/Fournisseur_Model.dart';
import '../Model/Produit/Produit_Model.dart';


class FactureItem extends StatefulWidget {
  Facture_Model? facture;
  FactureItem({Key? key,this.facture}) : super(key: key);

  @override
  _FactureItemState createState() => _FactureItemState();
}

class _FactureItemState extends State<FactureItem> {
  Facture_Manage manager=Facture_Manage();
  Client_Model? invoiceclient;
  Fournisseur_Model? invoicefournisseur;
  List<Produit_Model>? invoiceproduit;
  List<String>? invoiceproduitlist;
  List<String>? invoiceqt;
  List<String>? invoiceunit;
  void Delete_Facture()async {

    int insrtcleint=   await FactureSession.DeleteInvoice(widget.facture!.id!);
    if( insrtcleint!= 0)
    {
      showDialog(context: context, builder:(_)=>Success_Dialog(mytext: "Ce item est supprimé",mywidgets :()=> HomePage()));

    }

    else {
      print('results $insrtcleint');
    }


  }


  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }

  @override

  Widget build(BuildContext context) {
    double _width=MediaQuery.of(context).size.width;
    double _height=MediaQuery.of(context).size.height;
    return ChangeNotifierProvider.value(
      value: manager,

      child: Consumer<Facture_Manage>(
          builder: (Buildcontext, managere,_){
            return  GestureDetector(
              onTap: ()  {


                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Calculating(invoice: widget.facture!,),)
                );

                /*Facture_Model mywidget= await Envoices.facture!;
            final pdfFile= await  PdfEnvoiceApi.generate(mywidget);
            await PdfApi.openFile(pdfFile);*/
                // Navigator.push(context, MaterialPageRoute(builder: (context) => FactureDetailExported(facture: Envoices.facture! )))

              },
              child: Container(
                margin: const EdgeInsets.all(5.0) ,
                height: _height*0.04,
                decoration:  BoxDecoration(
                    color: Colors.white,
                    borderRadius:BorderRadius.all(Radius.circular(10)),
                    boxShadow: [BoxShadow(
                        blurRadius:5 ,
                        color: Colors.grey.withOpacity(0.2),
                        offset: Offset(0,3)
                    )]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Column(
                          children:  [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: (){
                                      showModalBottomSheet<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Container(
                                            height: 230,
                                            decoration: BoxDecoration(
                                                color:Colors.white,
                                                borderRadius: BorderRadius.circular(20)
                                            ),
                                            //color: Colors.amber,
                                            child:  Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                SizedBox(height: 5,),
                                                GestureDetector(
                                                  onTap:(){
                                                    Delete_Facture();
                                                  },
                                                  child: Container(
                                                    height: 60,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius: BorderRadius.circular(10),


                                                    ),
                                                    child: Center(child: Text('Supprimer cette facture',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),
                                                  ),
                                                ),

                                                SizedBox(height: 5,),
                                                GestureDetector(
                                                  onTap:(){},
                                                  child: Container(
                                                    height: 60,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color:ThemeStyle.muted,
                                                      borderRadius: BorderRadius.circular(10),

                                                    ),
                                                    child: Center(child: Text('Fermer le Diag',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),)),
                                                  ),
                                                ),

                                              ],

                                            ),
                                          );
                                        },
                                      );
                                      //Delete_Client();
                                    },


                                    icon: Icon(Icons.more_vert,size: 20,color: Colors.teal,))
                              ],
                            ),
                            const CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage("assets/images/facture.png",),
                              radius: 26,
                            ),
                            SizedBox(height: 5,),
                            Text('Facture N° '+widget.facture!.num_facture.toString(),style: GoogleFonts.lato(color:Colors.black,fontSize: 13,fontWeight: FontWeight.bold)),
                            Text(widget.facture!.date!.toString(),style: GoogleFonts.lato(color:Colors.black,fontSize: 12,fontWeight: FontWeight.bold)),

                          ],
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            );
          }

      ),
    );
  }}