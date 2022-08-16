import 'dart:io';
import 'package:flutter/services.dart';
import 'package:freelance/Envoices/PdfApi.dart';
import 'package:freelance/Model/BonLivraisson_Model.dart';
import 'package:freelance/Model/Client/Client_Model.dart';
import 'package:freelance/Model/Fcature/Facture_Model.dart';
import 'package:freelance/Model/Fournisseur/Fournisseur_Model.dart';
import 'package:freelance/Model/Produit/Produit_Model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' ;
//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
class PdfBillApi{

  static double? totaltva;
  static double?totalttc;
  static double?total;

  static Future<File> generate (Facture_Model invoice, Client_Model  invoiceclient, Fournisseur_Model invoicefournisseur, List<Produit_Model> invoiceproduit,List<String> qte,List<String> ute,BonLivraison_Model bill) async {
    totalttc=0;
    totaltva=0;
    final imageJpg =
    (await rootBundle.load('assets/images/logo.png')).buffer.asUint8List();

    final pdf = Document();

    pdf.addPage(MultiPage(
      build: (context) => [
        Column(
            children: [
              Center(child: Text('Bon de Livraison',style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),),),

              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.only(top:10 ),
                        height: 50,
                        width: 60,
                        child: Image(MemoryImage(imageJpg), fit: BoxFit.cover) ),

                    Center(child: Text(invoicefournisseur.company!,style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold,color: PdfColors.green),),),



                  ]
              ),
              // Center(child: Text(invoicefournisseur.activite!,style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.bold),),),
              Container(

    child: Center(child: Text(invoicefournisseur.activite!,textAlign: TextAlign.center,style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),),

    ),
              Center(child: Text(invoicefournisseur.address!,style: TextStyle(fontSize: 13.5),),),


            ]
        )


        ,
        buildHeader(invoice, invoiceclient,  invoicefournisseur, invoiceproduit,qte,ute,bill),
      ],
      // footer: (context) => buildFooter(invoice),
    ));

    return await PdfApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf);

  }


  static Widget buildHeader(Facture_Model invoice, Client_Model  invoiceclient, Fournisseur_Model invoicefournisseur,
      List<Produit_Model> invoiceproduit,List<String>qte,List<String>ute,BonLivraison_Model bill) {
    total=totalttc!+totaltva!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        SizedBox(height: 0.3 * PdfPageFormat.cm),
        Divider(),

        SizedBox(height: 0.5 * PdfPageFormat.cm),
        Center(
          child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildClientsection(invoiceclient),
                SizedBox(width: 1 * PdfPageFormat.cm),
                buildfournisseursection(invoicefournisseur),

              ]),
        ),

        SizedBox(height: 0.5 * PdfPageFormat.cm),

        Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(text: TextSpan(
                    children: [
                      TextSpan(text: 'Numero Facture  : ',style:TextStyle(fontSize: 12, fontWeight: FontWeight.bold) ),
                      TextSpan(text: invoice.num_facture.toString())
                    ]
                )),
                SizedBox(width: 1 * PdfPageFormat.cm),
                RichText(text: TextSpan(
                    children: [
                      TextSpan(text: 'Date : ',style:TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                      TextSpan(text: invoice.date.toString())
                    ]
                )),
              ]
          ),
        ),
        SizedBox(height: 0.5 * PdfPageFormat.cm),
        Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(text: TextSpan(
                    children: [
                      TextSpan(text: 'Moyen de Transport : ',style:TextStyle(fontSize: 11, fontWeight: FontWeight.bold) ),
                      TextSpan(text: bill.transport,style:TextStyle(fontSize: 11))
                    ]
                )),
                SizedBox(width: 1 * PdfPageFormat.cm),
                RichText(text: TextSpan(
                    children: [
                      TextSpan(text: 'Nom De Chauffeur : ',style:TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                      TextSpan(text: bill.chauffeur,style:TextStyle(fontSize: 11))
                    ]
                )),

              ]
          ),
        ),

        SizedBox(height: 0.5 * PdfPageFormat.cm),
        buildInvoice(invoiceproduit,qte,ute),
        SizedBox(height: 2 * PdfPageFormat.cm),
        //buildTvaInvoice(invoiceproduit,qte),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTvaInvoice(invoiceproduit,qte),
              Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 0.1 * PdfPageFormat.cm),
                              Text('Total Net Ht:',style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                              SizedBox(height: 0.1 * PdfPageFormat.cm),
                              Text('Total TVA:',style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                              SizedBox(height: 0.1 * PdfPageFormat.cm),
                              if(invoice.timber!=0) Text('Timber:',style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                              if(invoice.timber!=0) SizedBox(height: 0.1 * PdfPageFormat.cm),
                              Text('Total :',style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),


                            ]
                        ),
                        SizedBox(width: 0.4 * PdfPageFormat.cm),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 0.1 * PdfPageFormat.cm),
                              Text(totalttc!.toStringAsFixed(2),style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),),
                              SizedBox(height: 0.1 * PdfPageFormat.cm),
                              Text(totaltva!.toStringAsFixed(2),style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),),
                              SizedBox(height: 0.1 * PdfPageFormat.cm),
                              if(invoice.timber!=0) Text(((invoice.timber!/100)*totalttc!).toStringAsFixed(2),style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),),
                              if(invoice.timber!=0) SizedBox(height: 0.1 * PdfPageFormat.cm),
                              Text((totaltva!+totalttc!+(0.1*totalttc!)).toStringAsFixed(2),style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),),

                            ]
                        ),
                        SizedBox(width: 0.1 * PdfPageFormat.cm),
                      ]
                  )
              )
              //buildTotalInvoice(),

            ]),
        SizedBox(height: 2 * PdfPageFormat.cm),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: RichText(text: TextSpan(
                    children: [
                      TextSpan(text: 'Mode de  Payment : ',style:TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                      TextSpan(text: bill.mode_pay,style:TextStyle(fontSize: 11))
                    ]
                )),
              ),

              Align(
                alignment: Alignment.bottomRight,
                child:Text("Signature et Cache : ",style:TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
              )
            ]
        ),





        SizedBox(height: 1 * PdfPageFormat.cm),

      ],
    );
  }


  static  Widget buildClientsection(Client_Model client) =>
      Container(
          width:260,
          decoration: const BoxDecoration(
              color: PdfColors.white,
              borderRadius: BorderRadius.all(Radius.circular(5))

          ),
          child:
          Column(
            mainAxisAlignment:MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text("Client",style:TextStyle(fontWeight: FontWeight.bold,)),
              RichText(text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text:"Nom de Client : ",style:TextStyle(fontWeight: FontWeight.bold,) ),
                    TextSpan(text:"${client.fullname}" )

                  ]
              )),
              SizedBox(height: 1 * PdfPageFormat.mm),
              RichText(text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text:"Address : ",style:TextStyle(fontWeight: FontWeight.bold,) ),
                    TextSpan(text:"${client.address} Willaya ${client.willaya}" )

                  ]
              )),
              SizedBox(height: 1 * PdfPageFormat.mm),
              RichText(text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text:"Tel/Fax : ",style:TextStyle(fontWeight: FontWeight.bold,) ),
                    TextSpan(text:"${client.telephone}" )

                  ]
              )),
              SizedBox(height: 1 * PdfPageFormat.mm),
              RichText(text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text:"activité : ",style:TextStyle(fontWeight: FontWeight.bold,) ),
                    TextSpan(text:"${client.activite}" )

                  ]
              )),
              SizedBox(height: 1 * PdfPageFormat.mm),
              RichText(text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text:"N° Nif  : ",style:TextStyle(fontWeight: FontWeight.bold,) ),
                    TextSpan(text:"${client.nif}" )

                  ]
              )),
              SizedBox(height: 1 * PdfPageFormat.mm),
              RichText(text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text:"N° Nic  : ",style:TextStyle(fontWeight: FontWeight.bold,) ),
                    TextSpan(text:"${client.nic}" )

                  ]
              )),
              SizedBox(height: 1 * PdfPageFormat.mm),
              RichText(text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text:"N° Art  : ",style:TextStyle(fontWeight: FontWeight.bold,) ),
                    TextSpan(text:"${client.art}" )

                  ]
              )),
              SizedBox(height: 1 * PdfPageFormat.mm),
              RichText(text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text:"N° Rc  :  ",style:TextStyle(fontWeight: FontWeight.bold,) ),
                    TextSpan(text:"${client.rc}" )

                  ]
              ))

            ],
          ) );


  static  Widget buildfournisseursection(Fournisseur_Model fournisseur) =>
      Container(
          width:230,
          decoration: BoxDecoration(
            // color: PdfColors.grey100,
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text("Fournisseur",style:TextStyle(fontWeight: FontWeight.bold,)),
              Text('Entreprise Information',style: TextStyle(fontWeight: FontWeight.bold,)),
              SizedBox(height: 5 * PdfPageFormat.mm),
              RichText(text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text:"Tel/Fax  : ",style:TextStyle(fontWeight: FontWeight.bold,) ),
                    TextSpan(text:"${fournisseur.telephone}" )

                  ]
              )),
              SizedBox(height: 1 * PdfPageFormat.mm),
              RichText(text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text:"N° Nic  : ",style:TextStyle(fontWeight: FontWeight.bold,) ),
                    TextSpan(text:"${fournisseur.nif}" )

                  ]
              )),
              SizedBox(height: 1 * PdfPageFormat.mm),
              RichText(text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text:"N° Nic  : ",style:TextStyle(fontWeight: FontWeight.bold,) ),
                    TextSpan(text:"${fournisseur.nic}" )

                  ]
              )),
              SizedBox(height: 1 * PdfPageFormat.mm),
              RichText(text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text:"N° Art  : ",style:TextStyle(fontWeight: FontWeight.bold,) ),
                    TextSpan(text:"${fournisseur.art}" )

                  ]
              )),
              SizedBox(height: 1 * PdfPageFormat.mm),
              RichText(text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text:"N° Rc  : ",style:TextStyle(fontWeight: FontWeight.bold,) ),
                    TextSpan(text:"${fournisseur.rc}" )

                  ]
              )),

            ],
          )
      )
  ;

  static Widget buildInvoice(List<Produit_Model> produit,List<String> quantite,List<String> unite) {

    final headers = [
      'Code Article',
      'Designation',
      'Qte/unité',
      'Tva \%',
      'Prix Unit',
      'Total HT'
    ];
    final  data = produit.asMap().map((i,e){
      totalttc=totalttc!+(e.prix!*int.parse(quantite[i]));
      return MapEntry(i,[
        e.code,
        e.name,
        ' ${quantite[i] +' / '+unite[i]}',
        e.tva,
        e.prix,
        ' ${e.prix!*int.parse(quantite[i])} Da',



      ]);
    }).values.toList();



    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.green50),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerLeft,
        2: Alignment.centerLeft,
        3: Alignment.center,
        4: Alignment.centerLeft,
        5: Alignment.centerLeft,
      },
    );
  }
  static Widget buildTvaInvoice(List<Produit_Model> produit,List<String> quantite) {
    final headers = [
      'Tva',
      'Total Ht',
      'Montant Tva',
    ];
    final  data = produit.asMap().map((i,e){
      totaltva=totaltva!+ ((e.tva! * 0.01)*(e.prix!*int.parse(quantite[i])));
      return MapEntry(i,[
        e.tva,
        e.prix!*int.parse(quantite[i]),
        ((e.tva! * 0.01)*(e.prix!*int.parse(quantite[i]))),


      ]);
    }).values.toList();



    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.green50),
      cellHeight: 20,
      cellAlignments: {
        0: Alignment.center,
        1: Alignment.center,
        2: Alignment.center,
      },
    );
  }

  static Widget buildTotalInvoice() {
    final headers = [
      'Total TTC',
      'Total Tva',
      'Timber',
      'Total',
    ];

    final data=<List> [
      [  totalttc,
        totaltva,
        total , totaltva! + totalttc!,]

    ].toList();
    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      //headerDecoration: BoxDecoration(color: PdfColors.green50),
      cellHeight: 20,
      cellAlignments: {
        0: Alignment.center,
        1: Alignment.center,
        2: Alignment.center,
      },
    );
  }




}


