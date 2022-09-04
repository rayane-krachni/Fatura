import 'dart:ui';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:freelance/Model/Client/Client_Facture.dart';
import 'package:freelance/Model/Fournisseur/Founisseur_Facture.dart';
import 'package:freelance/Model/Produit/Produit_Facture.dart';
import 'package:freelance/Providers/Facture_Management.dart';
import 'package:freelance/Querries/Client_session.dart';
import 'package:freelance/Querries/Facture_Session.dart';
import 'package:freelance/Querries/Fournisseur_Session.dart';
import 'package:freelance/Querries/Produit_Session.dart';
import 'package:freelance/Screens/Facture.dart';
import 'package:freelance/Screens/HomePage.dart';
import 'package:freelance/widgets/Success_Diag.dart';
import 'package:freelance/widgets/Wrong_Diag.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Theme/Theme.dart';

class AddFacture extends StatefulWidget {
  const AddFacture({Key? key}) : super(key: key);

  @override
  State<AddFacture> createState() => _AddFactureState();
}

class _AddFactureState extends State<AddFacture> {
  Facture_Manage managerdata =Facture_Manage();
  List<String> unite=['g','Kg','Q','T','ml','cl','l'];
  TextEditingController ? timber_controller,fournisseur_control,client_control,facture_control,date_control,produit_control,quantite_control,remise_control;
  List<ClientFcture_Model> ? clientlist;

  List<TextEditingController> produitsquantite =[] ;
  List<TextEditingController>? produitsremise=[] ;
  List<String> controllerids = new List<String>.empty(growable: true);
  List<String> idslist = new List<String>.empty(growable: true);
  List<String> controllerquantite = new List<String>.empty(growable: true);
  List<String> controllerRemise = new List<String>.empty(growable: true);
  String? clientvalue ;
  String? fournisseurvalue ;
  String? produitvalue ;
  String? unitevalue;
  List<String> controllerunite=[];
  List<int> controllerid=[];
  List<String> listunite=[];
  List<String> controllerute = new List<String>.empty(growable: true);
  List<FournisseurFcture_Model>? fournisseurlist;
  List<ProduitFacture_Model>? produitlist;
  int? itemid;
  int? produititemid;
  int? fournisseuritemid;
  int? productid;
  int nbr_products=0;

  void getlistclient() async
  {
    List<ClientFcture_Model> myclientlist= await ClientSession.getClientName();

    clientlist=myclientlist;
    managerdata.loadingclient=true;

  }

  void getlistproduits() async
  {
    List<ProduitFacture_Model> myproduitlist= await ProduitSession.getProduitName();

    produitlist=myproduitlist;
    managerdata.loadingclient=true;

  }

  void getlistfournisseur() async
  {
    List<FournisseurFcture_Model> myfournisseurlist= await FournisseurSession.getFournisseursName();

    fournisseurlist=myfournisseurlist;
    managerdata.loadingfournisseur=true;

  }


  @override
  void initState() {
    // TODO: implement initState
    getlistclient();
    getlistfournisseur();
    getlistproduits();
    fournisseur_control= new TextEditingController();
    client_control= new TextEditingController();
    facture_control= new TextEditingController();
    date_control= new TextEditingController();
    produit_control= new TextEditingController();
    quantite_control= new TextEditingController();
    remise_control= new TextEditingController();
    timber_controller = new TextEditingController();
    //produitsquantite= new TextEditingController() as List<TextEditingController>?;
    //List<TextEditingController> produitsquantite = List.generate(74, (i) => TextEditingController());

    super.initState();

  }
  String get num_facture => facture_control!.text;
  int get id_client => int.parse(client_control!.text);
  int get id_fournisseur =>int.parse(fournisseur_control!.text);
  int get timber =>int.parse(timber_controller!.text);
  String get date => date_control!.text;
  String get id_produit => produit_control!.text;
  String get quantite => quantite_control!.text;
  String get remise => remise_control!.text;
  String dropdownvalue= "Select value";

  void Insert_envoice() async {
    getProductsQte(produitsquantite)!;
    ProduitstooId(controllerids,produitlist!);
    getProductsids(idslist);

    int insrtinvoice=   await FactureSession.Addinvoice(
        FournisseurtoId(fournisseurvalue!, fournisseurlist!)!,
        ClienttoId(clientvalue!, clientlist!)!,
        num_facture, date,
        getProductsids(idslist)! ,
        getProductsQte(produitsquantite)!,
        'getProductsremise(produitsremise!)!',
        getProductsunite(controllerunite)!,
        timber
        );
    if( insrtinvoice!= 0)
    {
      showDialog(context: context, builder:(_)=>Success_Dialog(mytext: "la facture a été bien créée ",mywidgets:()=> HomePage()));
    }
    else {
      showDialog(context: context, builder:(_)=> Wrong_Dialog());
      print('results $insrtinvoice');
    }

  }
  @override
  Widget build(BuildContext context) {
    double _width=MediaQuery.of(context).size.width;
    double _height=MediaQuery.of(context).size.height;
    return ChangeNotifierProvider.value(
      value: managerdata,
      child: Consumer<Facture_Manage>(
        builder: (context,facturemanage,_){
          return Scaffold(
            backgroundColor: ThemeStyle.scaffoldBgColor,
            appBar: AppBar(
              backgroundColor: ThemeStyle.scaffoldBgColor,
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.teal),
            ),

            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0,left: 20,right: 20),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text("Creer  une  Facture",style: ThemeStyle.addtitles,)),
                    const SizedBox(height: 5,),
                    Align(

                        alignment: Alignment.topLeft,
                        child: Text("Svp Remplir tous les champs necessaires",style: ThemeStyle.secondtitle,)),
                    const SizedBox(height: 10,),
                    if (!facturemanage.loadingclient || !facturemanage.loadingfournisseur) Text('wait ...')
                    else Form(
                        child:  Column(
                            mainAxisSize: MainAxisSize.min,
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
                                          hintText: "Date",
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
                                      padding: const EdgeInsets.only(top:1.0,left: 15,right: 5,bottom:12),
                                      child: TextFormField(
                                        controller: facture_control,
                                        decoration: const InputDecoration(
                                            hintText: "Num facture",
                                            suffixIcon: Icon(Icons.add_location,size: 18,)
                                        ),
                                      ),
                                    )),
                              ),
                             // SizedBox(height: 10,),
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
                                        controller: timber_controller,
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                            hintText: "Timber",
                                            suffixIcon: Icon(Icons.add_location,size: 18,)
                                        ),
                                      ),
                                    )),
                              ),
                              const SizedBox(height: 10,),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("les information du produit",style: ThemeStyle.secondtitle,)),

                              (facturemanage.incriment && nbr_products!=0)
                                  ? Flexible(

                                    child:  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: nbr_products,
                                    itemBuilder:(BuildContext context,int i){
                                      produitsremise!.add( TextEditingController());
                                      produitsquantite.add( TextEditingController());
                                     return   Column(
                                        children: [
                                          const  SizedBox(height: 10,),
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Text('Produit $i',style: ThemeStyle.secondtitle)),
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
                                                offset: Offset(0,3))]),
                                            child: Padding(
                                             padding: const EdgeInsets.only(top:10.0,left: 2,right: 5,bottom: 10),
                                              child: DropdownSearch<String>(
                                              mode: Mode.DIALOG,
                                              showSelectedItems: true,
                                              showSearchBox: true,
                                              maxHeight: _height/3,
                                              searchFieldProps: TextFieldProps(
                                              padding: const EdgeInsets.only(left: 30,right: 30,top: 5,bottom: 5),
                                               decoration: const InputDecoration(
                                                  border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                   color: Colors.teal)),
                                                   suffixIcon: Icon(Icons.search),
                                              ),

                                               style: GoogleFonts.ubuntu(color:  Colors.black,fontSize:12,fontWeight:FontWeight.w500)),
                                               dropdownBuilder:(BuildContext context, String? item) {
                                               return Text(item!,style:GoogleFonts.ubuntu(color: (item == "Selected Produit") ?   Colors.grey : Colors.black,fontSize:12,fontWeight:FontWeight.w500));
                                              },
                                                dropdownSearchDecoration: const InputDecoration(
                                                border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                color: Colors.teal)),
                                               focusedBorder: InputBorder.none,
                                               enabledBorder: InputBorder.none,
                                               errorBorder: InputBorder.none,
                                               contentPadding: EdgeInsets.only(left: 15),),
                                               items:ProduitsNames(produitlist!),
                                               popupItemBuilder: (BuildContext context, String? item, bool isSelected) {
                                                return Padding(
                                                  padding: EdgeInsets.only(left: 20,right:20,top: 25,bottom: (item == produitlist![produitlist!.length-1]) ? 20 : 0),
                                                  child: Text(item!,style:GoogleFonts.ubuntu(color: isSelected ? ThemeStyle.greenShadeD1 : Colors.black,fontSize:12,fontWeight:FontWeight.w500)),
                                                );
                                                },
                                                selectedItem: "Selected Produit",
                                                onChanged: (String? selectedItem) {

                                                 produitvalue = selectedItem;
                                                 intialids(produitvalue!, i);
                                                 ProduitstoId(produitvalue!, produitlist!);
                                                /* print( ProduitstoId(produitvalue!, produitlist!).toString());
                                                 controllerids.add(ProduitstoId(produitvalue!, produitlist!).toString());
                                                 print( controllerids.toString());
                                                 getProductsids(controllerids);
                                                 print(  getProductsids(controllerids).toString());
                                                // addClientModel.notifyLis();*/
                                                },
                                                ),
                                                ))),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 7.0),
                                          child: Container(
                                            decoration:  BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(Radius.circular(15)),
                                            boxShadow: [BoxShadow(
                                            blurRadius:5 ,
                                            color: Colors.grey.withOpacity(0.2),
                                            offset: Offset(0,3))]),
                                            child: Row(

                                              children: [

                                                SizedBox(

                                                    height: _height*0.062,
                                                    width: _width*0.38,

                                                    child: Padding(
                                                      padding: const EdgeInsets.only(top:1.0,left: 15,right: 5,bottom:12),
                                                      child: TextFormField(
                                                        controller: produitsquantite![i],
                                                        keyboardType: TextInputType.number,

                                                        decoration: const InputDecoration(
                                                            hintText: "Quantite",
                                                            //suffixIcon: Icon(Icons.code,size: 18,)
                                                        ),
                                                      ),
                                                    )),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 8.0,left: 20),
                                                  child: SizedBox(

                                                    width: _width*0.4,
                                                    child: DropdownSearch<String>(
                                                      mode: Mode.DIALOG,
                                                      showSelectedItems: true,
                                                      showSearchBox: true,
                                                      maxHeight: _height/3,
                                                      searchFieldProps: TextFieldProps(
                                                          padding: const EdgeInsets.only(left: 30,right: 30,top: 5,bottom: 5),
                                                          decoration: const InputDecoration(
                                                            border: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors.teal)),
                                                            suffixIcon: Icon(Icons.search),
                                                          ),

                                                          style: GoogleFonts.ubuntu(color:  Colors.black,fontSize:12,fontWeight:FontWeight.w500)),
                                                      dropdownBuilder:(BuildContext context, String? item) {
                                                        return Padding(
                                                          padding: const EdgeInsets.only(top: 15.0),
                                                          child: Text(item!,style:GoogleFonts.ubuntu(color: (item == "unite") ?   Colors.grey : Colors.black,fontSize:12,fontWeight:FontWeight.w500)),
                                                        );
                                                      },
                                                      dropdownSearchDecoration: const InputDecoration(
                                                        border: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors.teal)),
                                                        focusedBorder: InputBorder.none,
                                                        enabledBorder: InputBorder.none,
                                                        errorBorder: InputBorder.none,
                                                        contentPadding: EdgeInsets.only(left: 15),),
                                                      items:unite,
                                                      popupItemBuilder: (BuildContext context, String? item, bool isSelected) {
                                                        return Padding(
                                                          padding: EdgeInsets.only(left: 20,right:20,top: 20,bottom: (item == unite[unite.length-1]) ? 20 : 0),
                                                          child: Text(item!,style:GoogleFonts.ubuntu(color: isSelected ? ThemeStyle.greenShadeD1 : Colors.black,fontSize:12,fontWeight:FontWeight.w500)),
                                                        );
                                                      },
                                                      selectedItem: "unite",

                                                      onChanged: (String? selectedItem) {
                                                        setState(() {

                                                          unitevalue = selectedItem;
                                                          intialunit(unitevalue!, i);
                                                          //.add(unitevalue!);

                                                        //  getProductsunite(controllerunite);
                                                        });


                                                      },
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      /*  Padding(
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
                                                  controller: produitsremise![i],
                                                  decoration: const InputDecoration(
                                                      hintText: "Remise",
                                                      suffixIcon: Icon(Icons.code,size: 18,)
                                                  ),
                                                ),
                                              )),
                                        ),*/
                                        SizedBox(height: 10,),
                                      ],
                                    ) ;
                                    } ,
                                    )

                              )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            IconButton(onPressed: ()=>{}, icon: Icon(Icons.add)),
                            TextButton(onPressed: (){
                              incremment_product();

                            }, child: Text("Ajouter un autre produits",style: ThemeStyle.secondtitle,),)
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

                            Insert_envoice();
                          },

                          style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                          child: Center(child: Text("Ajouter",style: ThemeStyle.buttontext,))
                      ),
                    )


                  ],
                ),
              ),
            ),
          );
        },

      ),
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
        itemid=clients[i].id;
      }
    }


    return itemid;

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



    return fournisseuritemid;

  }

  List<String> ProduitsNames(List<ProduitFacture_Model> produits) {
    List<String> names = new List<String>.empty(growable: true);
    for (int i = 0; i < produits.length; i++) names.add(produits[i].name!);
    return names;
  }

  int? ProduitstoId(String name,List<ProduitFacture_Model> produits){

    for (int i = 0; i < produits.length; i++)
    {
      if(produits[i].name==name)
      {
        produititemid=produits[i].id;
      }
    }



    return produititemid;

  }
  //controllerids
  void intialids(String val, int index){

    print('cases}');
    if(controllerids.length==0 )
    {

      print('if0 id case');
      controllerids.add(val);

      print('else id  case');



    }
    else{
      if(index<controllerids.length){
        for(int j=0;j< controllerids.length;j++)
        {
          print('if1 case');
          if(j==index)
          {        print('if2 case');
          controllerids[j]=val;

          print(controllerids[j] + '${index}');



          }

        }
      }
      else{


        controllerids.add(val);}


    }
    print(controllerids);

  }
  void ProduitstooId(List<String> name,List<ProduitFacture_Model> produits){

    idslist=[];
    name.forEach((element) {

      for (int i = 0; i < produits.length; i++)
      {
        if(produits[i].name==element)
        {
          produititemid=produits[i].id;
          print('produititemid : $produititemid');
          idslist.add(produititemid.toString());
          print('ProduitstooId : $idslist');
        }
      }
      print('ProduitstooId : $idslist');


    });






  }
  String? getProductsids (List<String> id){
    String myids="";
    //controllerids.add(id.toString());
    if(id!=null){
      for(int i=0;i<id.length; i++)
      {

        myids=myids+id[i]+';';

      }}
    if (myids != "" && myids.length > 0) {
      myids = myids.substring(0, myids.length - 1);
    }
    print('myids$myids');
    return myids;


  }
  //
  int? incremment_product() {
    nbr_products=  nbr_products +1;
    //controllerunite= List.generate(nbr_products, (index) => '');
    managerdata.incriment=true;
    return nbr_products;


  }



  String? getProductsQte (List<TextEditingController> Quantite){
    String myqte="";

   for(int i =0;i< Quantite.length ; i++)
   {
     print('qte ${Quantite[i].text}');

     if(Quantite[i].text != "" && Quantite.length>0 )
     {
       myqte=myqte + Quantite[i].text ;
       myqte=myqte+';';

     }

   }

    print('qte ${myqte}');
    return myqte;


  }

  String? getProductsremise (List<TextEditingController> Remise){
    String myremise="";

    for(int i =0;i< Remise.length ; i++)
    {

      if(Remise[i].text != "" && Remise.length>0 )
      {
        myremise=myremise + Remise[i].text ;
        myremise=myremise+';';

      }

    }


    if (myremise != "" && myremise.length > 0) {
      myremise = myremise.substring(0, myremise.length - 1);
    }

    return myremise;


  }

  void intialunit(String val, int index){

    print('cases}');
    if(controllerunite.length==0 )
    {

      print('if0 case');
      controllerunite.add(val);

      print('else case');



    }
    else{
      if(index<controllerunite.length){
        for(int j=0;j< controllerunite.length;j++)
        {
          print('if1 case');
          if(j==index)
          {        print('if2 case');
          controllerunite[j]=val;

          print(controllerunite[j] + '${index}');



          }

        }
      }
      else{


      controllerunite.add(val);}


    }
    print(controllerunite);

  }

  String? getProductsunite (List<String> unite){
    print(unite);
    String myunity="";


      for(int i=0;i<unite.length; i++)
      {

        if(i==0){

          myunity=myunity+unite[i]+';';}
        else{

          myunity=myunity+unite[i]+';';}


      }

      print(myunity);

    myunity = myunity.substring(0, myunity.length - 1);
    return myunity;


  }



}

