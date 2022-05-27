import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:freelance/Model/Client/Client_Facture.dart';
import 'package:freelance/Model/Fcature/Facture_Bills.dart';
import 'package:freelance/Model/Fournisseur/Founisseur_Facture.dart';
import 'package:freelance/Providers/BonLivraisson_Management.dart';
import 'package:freelance/Querries/BonLivraison_Session.dart';
import 'package:freelance/Querries/Client_session.dart';
import 'package:freelance/Querries/Facture_Session.dart';
import 'package:freelance/Querries/Fournisseur_Session.dart';
import 'package:freelance/Screens/Facture.dart';
import 'package:freelance/Screens/HomePage.dart';
import 'package:freelance/controller.dart';
import 'package:freelance/widgets/Success_Diag.dart';
import 'package:freelance/widgets/Wrong_Diag.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Theme/Theme.dart';

class AddLivraison extends StatefulWidget {
  const AddLivraison({Key? key}) : super(key: key);

  @override
  State<AddLivraison> createState() => _AddLivraisonState();
}

class _AddLivraisonState extends State<AddLivraison> {

  TextEditingController ? fournisseur_control,client_control,facture_control,date_control,transport_control,matricule_control,chauffeur_control,mode_pay_control;
  Bills_Manage Manager= Bills_Manage();
  int? clientitemid;
  int? fournisseuritemid;
  int? factureitemid;
  String? clientvalue ;
  String? facturevalue ;
  String? fournisseurvalue ;
  List<FournisseurFcture_Model>? fournisseurlist;
  List<ClientFcture_Model> ? clientlist;
  List<FactureBills_Model> ? facturelist;
 // int get id_facture => int.parse(fournisseur_control!.text);
  int get id_facture => int.parse(facture_control!.text);
  void getlistclient() async
  {
    List<ClientFcture_Model> myclientlist= await ClientSession.getClientName();
    print('mmm $myclientlist');
    clientlist=myclientlist;
    Manager.loadingclient=true;
    print('ggg $clientlist');
  }

  void getlistfournisseur() async
  {
    List<FournisseurFcture_Model> myfournisseurlist= await FournisseurSession.getFournisseursName();
    print('rrr $myfournisseurlist');
    fournisseurlist=myfournisseurlist;
    Manager.loadingfournisseur=true;
    print('fff $fournisseurlist');
  }

  void getlistbills() async
  {
    List<FactureBills_Model> myfacturelist= await FactureSession.getfactureids();
    print('mmm $myfacturelist');
    facturelist=myfacturelist;
    Manager.loadingenvoices=true;
    print('ggg $myfacturelist');
  }

  @override
  void initState() {

    getlistclient();
    getlistfournisseur();
    getlistbills();
    fournisseur_control= new TextEditingController();
    client_control= new TextEditingController();
    facture_control= new TextEditingController();
    date_control= new TextEditingController();
    transport_control= new TextEditingController();
    matricule_control= new TextEditingController();
    chauffeur_control= new TextEditingController();
    mode_pay_control= new TextEditingController();
    super.initState();
  }

  int get id_client => int.parse(client_control!.text);
  int get id_fournisseur =>int.parse(fournisseur_control!.text);
  String get date => date_control!.text;
  String get transport => transport_control!.text;
  String get matricule => matricule_control!.text;
  String get chauffeur => chauffeur_control!.text;
  String get mode_pay => mode_pay_control!.text;


  void Insert_Bills() async {
    print('++++++ ${EnvoicetoId(facturevalue!, facturelist!)!}');

    int insrtbills=   await BonLivraisonSession.Addbills(FournisseurtoId(fournisseurvalue!, fournisseurlist!)!, ClienttoId(clientvalue!, clientlist!)!, EnvoicetoId(facturevalue!, facturelist!)!, date, transport, matricule, chauffeur, mode_pay);
    print('insrtbills $insrtbills');
    if( Controller.isNumiric(insrtbills.toString()))
    {
      showDialog(context: context, builder:(_)=>Success_Dialog(mytext: "Client done",mywidgets: ()=>HomePage()));
    }
   if(!Controller.isNumiric(insrtbills.toString())) {
      showDialog(context: context, builder:(_)=>Wrong_Dialog(mytext: "tttt",));
    }

  }

  @override
  Widget build(BuildContext context) {
    double _width=MediaQuery.of(context).size.width;
    double _height=MediaQuery.of(context).size.height;
    return ChangeNotifierProvider.value(
      value: Manager,
      child:Consumer<Bills_Manage>(
          builder: (context,billsmanage,_){
            return Scaffold(
                backgroundColor: ThemeStyle.scaffoldBgColor,
                appBar: AppBar(
                  backgroundColor: ThemeStyle.scaffoldBgColor,
                  elevation: 0,
                  iconTheme: const IconThemeData(color: Colors.teal),
                ),

                body: Padding(
                  padding: const EdgeInsets.only(top: 5.0,left: 20,right: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text("Creer  une  Bonne de Livrason",style: ThemeStyle.addtitles,)),
                        const SizedBox(height: 5,),
                        Align(

                            alignment: Alignment.topLeft,
                            child: Text("Svp Remplir tous les champs necessaire",style: ThemeStyle.secondtitle,)),
                        const SizedBox(height: 10,),
                        if (!billsmanage.loadingclient || !billsmanage.loadingfournisseur || !billsmanage.loadingenvoices) Text('wait ...')
                        else Form(
                            child: Column(
                              children: [

                                Padding(
                                    padding: const EdgeInsets.only(top: 7.0),
                                    child: Container(

                                        height: _height*0.062,
                                        width: double.infinity,
                                        decoration:  BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(Radius.circular(15)),
                                            boxShadow: [BoxShadow(
                                                blurRadius:5 ,
                                                color: Colors.grey.withOpacity(0.2),
                                                offset: Offset(0,3)
                                            )]
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(top:10.0,left: 2,right: 5,bottom: 10),
                                          child:
                                          DropdownSearch<String>(
                                            mode: Mode.DIALOG,
                                            showSelectedItems: true,
                                            showSearchBox: true,
                                            maxHeight: _height/3,
                                            searchFieldProps: TextFieldProps(
                                                padding: const EdgeInsets.only(left: 30,right: 30,top: 5,bottom: 5),
                                                decoration: const InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.teal
                                                      )
                                                  ),
                                                  suffixIcon: Icon(Icons.search),
                                                ),

                                                style: GoogleFonts.ubuntu(color:  Colors.black,fontSize:12,fontWeight:FontWeight.w500)),
                                            dropdownBuilder:(BuildContext context, String? item) {
                                              return Text(item!,style:GoogleFonts.ubuntu(color: (item == "Selected Client") ?   Colors.grey : Colors.black,fontSize:12,fontWeight:FontWeight.w500));
                                            },
                                            dropdownSearchDecoration: const InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.teal
                                                  )
                                              ),
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              contentPadding: EdgeInsets.only(left: 15),
                                            ),
                                            items:clientNames(clientlist!),
                                            popupItemBuilder: (BuildContext context, String? item, bool isSelected) {
                                              return Padding(
                                                padding: EdgeInsets.only(left: 20,right:20,top: 25,bottom: (item == clientlist![clientlist!.length-1]) ? 20 : 0),
                                                child: Text(item!,style:GoogleFonts.ubuntu(color: isSelected ? ThemeStyle.greenShadeD1 : Colors.black,fontSize:12,fontWeight:FontWeight.w500)),
                                              );
                                            },
                                            selectedItem: "Selected Client",
                                            onChanged: (String? selectedItem) {
                                              clientvalue = selectedItem;
                                              ClienttoId(clientvalue!, clientlist!);
                                              // addClientModel.notifyLis();
                                            },
                                          ),
                                        ))),
                                Padding(
                                    padding: const EdgeInsets.only(top: 7.0),
                                    child: Container(

                                        height: _height*0.062,
                                        width: double.infinity,
                                        decoration:  BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(Radius.circular(15)),
                                            boxShadow: [BoxShadow(
                                                blurRadius:5 ,
                                                color: Colors.grey.withOpacity(0.2),
                                                offset: Offset(0,3)
                                            )]
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(top:10.0,left: 2,right: 5,bottom: 10),
                                          child:
                                          DropdownSearch<String>(
                                            mode: Mode.DIALOG,
                                            showSelectedItems: true,
                                            showSearchBox: true,

                                            maxHeight: _height/3,
                                            searchFieldProps: TextFieldProps(
                                                decoration: const InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.teal
                                                      )
                                                  ),
                                                  suffixIcon: Icon(Icons.search),
                                                ),
                                                style: GoogleFonts.ubuntu(color:  Colors.black,fontSize:12,fontWeight:FontWeight.w500)),
                                            dropdownBuilder:(BuildContext context, String? item) {
                                              return Text(item!,style:GoogleFonts.ubuntu(color: (item == "Select Fournisseur") ?   Colors.grey : Colors.black,fontSize:12,fontWeight:FontWeight.w500));
                                            },
                                            dropdownSearchDecoration: const InputDecoration(
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              contentPadding: EdgeInsets.only(left: 15),
                                            ),
                                            items:fournisseurNames(fournisseurlist!),
                                            popupItemBuilder: (BuildContext context, String? item, bool isSelected) {
                                              return Padding(
                                                padding: EdgeInsets.only(left: 20,right:20,top: 25,bottom: (item == clientlist![clientlist!.length-1]) ? 20 : 0),
                                                child: Text(item!,style:GoogleFonts.ubuntu(color: isSelected ? ThemeStyle.greenShadeD1 : Colors.black,fontSize:12,fontWeight:FontWeight.w500)),
                                              );
                                            },
                                            selectedItem: "Select Fournisseur",
                                            onChanged: (String? selectedItem) {
                                              fournisseurvalue = selectedItem;
                                              FournisseurtoId(fournisseurvalue!, fournisseurlist!);
                                              // addClientModel.notifyLis();
                                            },
                                          ),
                                        ))),
                                Padding(
                                  padding: const EdgeInsets.only(top: 7.0),
                                  child: Container(

                                      height: _height*0.062,
                                      width: double.infinity,
                                      decoration:  BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(15)),
                                          boxShadow: [BoxShadow(
                                              blurRadius:5 ,
                                              color: Colors.grey.withOpacity(0.2),
                                              offset: Offset(0,3)
                                          )]
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top:1.0,left: 15,right: 5,bottom:12),
                                        child: TextFormField(
                                          controller: date_control,
                                          decoration: const InputDecoration(
                                            hintText: "Data",
                                            suffixIcon:  Icon(Icons.phone,size: 18,),
                                          ),
                                        ),
                                      )),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 7.0),
                                    child: Container(

                                        height: _height*0.062,
                                        width: double.infinity,
                                        decoration:  BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(Radius.circular(15)),
                                            boxShadow: [BoxShadow(
                                                blurRadius:5 ,
                                                color: Colors.grey.withOpacity(0.2),
                                                offset: Offset(0,3)
                                            )]
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(top:10.0,left: 2,right: 5,bottom: 10),
                                          child:
                                          DropdownSearch<String>(
                                            mode: Mode.DIALOG,
                                            showSelectedItems: true,
                                            showSearchBox: true,

                                            maxHeight: _height/3,
                                            searchFieldProps: TextFieldProps(
                                                decoration: const InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.teal
                                                      )
                                                  ),
                                                  suffixIcon: Icon(Icons.search),
                                                ),
                                                style: GoogleFonts.ubuntu(color:  Colors.black,fontSize:12,fontWeight:FontWeight.w500)),
                                            dropdownBuilder:(BuildContext context, String? item) {
                                              return Text(item!,style:GoogleFonts.ubuntu(color: (item == "Select Facture") ?   Colors.grey : Colors.black,fontSize:12,fontWeight:FontWeight.w500));
                                            },
                                            dropdownSearchDecoration: const InputDecoration(
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              contentPadding: EdgeInsets.only(left: 15),
                                            ),
                                            items:EvnvoiceNames(facturelist!),
                                            popupItemBuilder: (BuildContext context, String? item, bool isSelected) {
                                              return Padding(
                                                padding: EdgeInsets.only(left: 20,right:20,top: 25,bottom: (item == facturelist![facturelist!.length-1]) ? 20 : 0),
                                                child: Text(item!,style:GoogleFonts.ubuntu(color: isSelected ? ThemeStyle.greenShadeD1 : Colors.black,fontSize:12,fontWeight:FontWeight.w500)),
                                              );
                                            },
                                            selectedItem:  "Select Facture",
                                            onChanged: (String? selectedItem) {
                                              print('facturevalue $facturevalue');
                                              facturevalue = selectedItem;
                                              EnvoicetoId(facturevalue!, facturelist!);
                                              // addClientModel.notifyLis();
                                            },
                                          ),
                                        ))),
                                SizedBox(height: 10,),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text("les information du Transport",style: ThemeStyle.secondtitle,)),


                                Padding(
                                  padding: const EdgeInsets.only(top: 7.0),
                                  child: Container(

                                      height: _height*0.062,
                                      width: double.infinity,
                                      decoration:  BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(15)),
                                          boxShadow: [BoxShadow(
                                              blurRadius:5 ,
                                              color: Colors.grey.withOpacity(0.2),
                                              offset: Offset(0,3)
                                          )]
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top:1.0,left: 15,right: 5,bottom:12),
                                        child: TextFormField(
                                          controller: transport_control,
                                          decoration: InputDecoration(
                                              hintText: "Moyen Du transport",
                                              suffixIcon: Icon(Icons.location_city,size: 18,)
                                          ),
                                        ),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 7.0),
                                  child: Container(

                                      height: _height*0.062,
                                      width: double.infinity,
                                      decoration:  BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(15)),
                                          boxShadow: [BoxShadow(
                                              blurRadius:5 ,
                                              color: Colors.grey.withOpacity(0.2),
                                              offset: Offset(0,3)
                                          )]
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top:1.0,left: 15,right: 5,bottom:12),
                                        child: TextFormField(
                                          controller: matricule_control,
                                          decoration: const InputDecoration(
                                              hintText: "Matricule",
                                              suffixIcon: Icon(Icons.code,size: 18,)
                                          ),
                                        ),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 7.0),
                                  child: Container(

                                      height: _height*0.062,
                                      width: double.infinity,
                                      decoration:  BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(15)),
                                          boxShadow: [BoxShadow(
                                              blurRadius:5 ,
                                              color: Colors.grey.withOpacity(0.2),
                                              offset: Offset(0,3)
                                          )]
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top:1.0,left: 15,right: 5,bottom:12),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              hintText: "Nom Du chaufeur",
                                              suffixIcon: Icon(Icons.code,size: 18,)
                                          ),
                                        ),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 7.0),
                                  child: Container(

                                      height: _height*0.062,
                                      width: double.infinity,
                                      decoration:  BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(15)),
                                          boxShadow: [BoxShadow(
                                              blurRadius:5 ,
                                              color: Colors.grey.withOpacity(0.2),
                                              offset: Offset(0,3)
                                          )]
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top:1.0,left: 15,right: 5,bottom:12),
                                        child: TextFormField(
                                          controller: mode_pay_control,
                                          decoration: const InputDecoration(
                                              hintText: "Mode Du Payment",
                                              suffixIcon: Icon(Icons.code,size: 18,)
                                          ),
                                        ),
                                      )),
                                ),


                              ],
                            )),
                        SizedBox(height: 20,),
                        Container(
                          width: _width,
                          height: _height*0.063,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),


                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.teal,
                                Colors.tealAccent,
                              ],
                            ),  ),

                          child: ElevatedButton(
                              onPressed: () {
                                Insert_Bills();
                              },

                              style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                              child: Center(child: Text("Ajouter",style: ThemeStyle.buttontext,))
                          ),
                        )


                      ],
                    ),
                  ),
                ),
              );})
    );
  }
  List<String> clientNames(List<ClientFcture_Model> clients) {
    List<String> names = new List<String>.empty(growable: true);
    for (int i = 0; i < clients.length; i++) names.add(clients[i].fullname!);
    return names;
  }

  int? ClienttoId(String name,List<ClientFcture_Model> clients){

    for (int i = 0; i < clients.length; i++)
    {
      if(clients[i].fullname==name)
      {
        clientitemid=clients[i].id;
      }
    }


    print("idclient $clientitemid");
    return clientitemid;

  }


  List<String> fournisseurNames(List<FournisseurFcture_Model> fournisseur) {
    List<String> names = new List<String>.empty(growable: true);
    for (int i = 0; i < fournisseur.length; i++) names.add(fournisseur[i].fullname!);
    return names;
  }

  int? FournisseurtoId(String name,List<FournisseurFcture_Model> fournisseurs){

    for (int i = 0; i < fournisseurs.length; i++)
    {
      if(fournisseurs[i].fullname==name)
      {
        fournisseuritemid=fournisseurs[i].id;
      }
    }


    print("idfournisseur $fournisseuritemid");
    return fournisseuritemid;

  }

  List<String> EvnvoiceNames(List<FactureBills_Model> facture) {
    List<String> num = new List<String>.empty(growable: true);
    for (int i = 0; i < facture.length; i++) num.add(facture[i].num_facture!.toString());
    return num;
  }

  int? EnvoicetoId(String name,List<FactureBills_Model> facture){
    print('name$name');
    print('name$name');
    for (int i = 0; i < facture.length; i++)
    {
      print('name${facture[i].num_facture!.toString()}');
      print('ids ${facture[i].id!.toString()}');

      if(  name == facture[i].num_facture.toString() )
      {
        print("idr  factureee 11 $factureitemid");
        factureitemid=facture[i].id;
        print("idr  factureee 22 $factureitemid");
      }
    }


    print("idrfactureee $factureitemid");
    return factureitemid;

  }
}
