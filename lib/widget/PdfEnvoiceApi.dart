import 'dart:io';
import 'package:freelance/Model/Client/Client_Model.dart';
import 'package:freelance/Model/Fcature/Facture_Model.dart';
import 'package:freelance/Model/Fournisseur/Fournisseur_Model.dart';
import 'package:freelance/Querries/Client_session.dart';
import 'package:freelance/Querries/Fournisseur_Session.dart';
import 'package:freelance/Screens/Details/Facture_Detail/header_envoice.dart';
import 'package:freelance/widget/PdfApi.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' ;

class PdfEnvoiceApi{

  static Client_Model ? clientlist;
  static Fournisseur_Model ? fournisseurlist;
  static void getlistclient(int id ) async
  {
    List<Client_Model> myclientlist= await ClientSession.getClientbyid(id);
    print('mmm $myclientlist');
    clientlist=myclientlist[0];
    //managerdata.loadingclient=true;
    print('ggg ${clientlist!}');
  }

  static void getlistfournisseur(int id) async
  {
    List<Fournisseur_Model> myfournisseurlist= await FournisseurSession.getfournisseurbyid(id);
    print('mmm $myfournisseurlist');
    fournisseurlist=myfournisseurlist[0];
    //managerdata.loadingfournisseur=true;
    print('ggg ${fournisseurlist!}');
  }
  static Future<File> generate (Facture_Model invoice) async {
    getlistclient(invoice.id_client!);
    getlistfournisseur(invoice.id_fournisseur!);
    final pdf = Document();
    pdf.addPage(MultiPage(
      build: (context) => [
        buildHeader(invoice),
        Divider(),


       // buildTotal(invoice),
      ],
     // footer: (context) => buildFooter(invoice),
    ));

    return PdfApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf);

  }


  static Widget buildHeader(Facture_Model invoice) =>
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(height: 0.5 * PdfPageFormat.cm),
      Center(child: Text('Fcature Num ${invoice.num_facture}',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),)
      , SizedBox(height: 0.5 * PdfPageFormat.cm),
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      buildClientsection(clientlist!),
      buildfournisseursection(fournisseurlist!),
      ]),
/* Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

         // buildSupplierAddress(invoice.supplier),
          Container(
            height: 50,
            width: 50,
            child: BarcodeWidget(
              barcode: Barcode.qrCode(),
              data: invoice.info.number,
            ),
          ),
        ],
      ),*/
      SizedBox(height: 1 * PdfPageFormat.cm),

    ],
  );

  static  Widget buildClientsection(Client_Model client) => Column(
    mainAxisAlignment:MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Client : ${client.fullname}"),
      Text("Address : ${client.address}"),
      Text("Tel/Fax : ${client.telephone}"),
      Text("Activite : ${client.activite}"),
      Text("No Nif : ${client.nif}"),
      Text("No Nic : ${client.nic}"),
      Text("No Art : ${client.art}"),
      Text("No rc : ${client.rc}"),
    ],
  ) ;

  static  Widget buildfournisseursection(Fournisseur_Model fournisseur) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Client : ${fournisseur.fullname}"),
      Text("Address : ${fournisseur.address}"),
      Text("Tel/Fax : ${fournisseur.telephone}"),
      Text("Activite : ${fournisseur.activite}"),
      Text("No Nif : ${fournisseur.nif}"),
      Text("No Nic : ${fournisseur.nic}"),
      Text("No Art : ${fournisseur.art}"),
      Text("No rc : ${fournisseur.rc}"),
    ],
  ) ;


}


