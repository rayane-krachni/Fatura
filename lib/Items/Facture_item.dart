import 'package:flutter/material.dart';
import 'package:freelance/Items/Calculate.dart';
import 'package:freelance/Model/Fcature/Facture_Model.dart';
import 'package:freelance/Providers/Facture_Management.dart';
import 'package:freelance/Querries/Client_session.dart';
import 'package:freelance/Querries/Facture_Session.dart';
import 'package:freelance/Screens/Details/Facture_Detail/Detail_Facture.dart';
import 'package:freelance/Screens/HomePage.dart';
import 'package:freelance/widget/PdfApi.dart';
import 'package:freelance/widget/PdfEnvoiceApi.dart';
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
      showDialog(context: context, builder:(_)=>Success_Dialog(mytext: "Client done",mywidgets :()=> HomePage()));
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

              /*Facture_Model mywidget= await widget.facture!;
            final pdfFile= await  PdfEnvoiceApi.generate(mywidget);

            await PdfApi.openFile(pdfFile);*/
              // Navigator.push(context, MaterialPageRoute(builder: (context) => FactureDetailExported(facture: widget.facture! )))

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
                              IconButton(onPressed: (){
                                Delete_Facture();
                              }, icon: Icon(Icons.more_vert,size: 30,color: Colors.teal,))
                            ],
                          ),
                          const CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage("assets/images/facture.png",),
                            radius: 30,
                          ),
                          SizedBox(height: 10,),
                          Text(widget.facture!.num_facture.toString(),style: GoogleFonts.lato(color:Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),

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
  }
}
