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
  List<String> unite=['g','Kg','Q','T'];
  TextEditingController ? fournisseur_control,client_control,facture_control,date_control,produit_control,quantite_control,remise_control;
  List<ClientFcture_Model> ? clientlist;

  List<TextEditingController>? produitsquantite =[] ;
  List<TextEditingController>? produitsremise=[] ;
  List<String> controllerids = new List<String>.empty(growable: true);
  List<String> controllerquantite = new List<String>.empty(growable: true);
  List<String> controllerRemise = new List<String>.empty(growable: true);
  String? clientvalue ;
  String? fournisseurvalue ;
  String? produitvalue ;
  String? unitevalue;
  List<String>? controllerunite=[];
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
    print('mmm $myclientlist');
    clientlist=myclientlist;
    managerdata.loadingclient=true;
    print('ggg $clientlist');
  }

  void getlistproduits() async
  {
    List<ProduitFacture_Model> myproduitlist= await ProduitSession.getProduitName();
    print('mmm $myproduitlist');
    produitlist=myproduitlist;
    managerdata.loadingclient=true;
    print('ggg $produitlist');
  }

  void getlistfournisseur() async
  {
    List<FournisseurFcture_Model> myfournisseurlist= await FournisseurSession.getFournisseursName();
    print('rrr $myfournisseurlist');
    fournisseurlist=myfournisseurlist;
    managerdata.loadingfournisseur=true;
    print('fff $fournisseurlist');
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
    //produitsquantite= new TextEditingController() as List<TextEditingController>?;
    //List<TextEditingController> produitsquantite = List.generate(74, (i) => TextEditingController());

    super.initState();

  }
  int get num_facture => int.parse(facture_control!.text);
  int get id_client => int.parse(client_control!.text);
  int get id_fournisseur =>int.parse(fournisseur_control!.text);
  String get date => date_control!.text;
  String get id_produit => produit_control!.text;
  String get quantite => quantite_control!.text;
  String get remise => remise_control!.text;
  String dropdownvalue= "Select value";

  void Insert_envoice() async {
    print(getProductsQte(produitsquantite!));
    print(getProductsremise(produitsremise!));
    print(getProductsunite(controllerunite!));

    int insrtinvoice=   await FactureSession.Addinvoice(
        FournisseurtoId(fournisseurvalue!, fournisseurlist!)!,
        ClienttoId(clientvalue!, clientlist!)!,
        num_facture, date,
        getProductsids(controllerids)! ,
        getProductsQte(produitsquantite!)!,
        getProductsremise(produitsremise!)!,
        getProductsunite(controllerunite!)!);
    if( insrtinvoice!= 0)
    {
      showDialog(context: context, builder:(_)=>Success_Dialog(mytext: "Client done",mywidgets:()=> HomePage()));
    }
    else {
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
                        child: Text("Svp Remplir tous les champs necessaire",style: ThemeStyle.secondtitle,)),
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
                              SizedBox(height: 10,),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("les information du produit",style: ThemeStyle.secondtitle,)),

                              (facturemanage.incriment && nbr_products!=0)
                                  ? Flexible(

                                    child:  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: nbr_products,
                                    itemBuilder:(BuildContext context,int i){
                                      produitsremise!.add(new TextEditingController());
                                      produitsquantite!.add(new TextEditingController());
                                     return   Column(
                                        children: [
                                        Text('produits $i'),
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
                                                 ProduitstoId(produitvalue!, produitlist!);
                                                 controllerids.add(ProduitstoId(produitvalue!, produitlist!).toString());
                                                 getProductsids(controllerids);
                                                // addClientModel.notifyLis();
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
                                                        unitevalue = selectedItem;
                                                        controllerunite!.add(unitevalue!);

                                                       // ProduitstoId(produitvalue!, produitlist!);
                                                       // controllerids.add(ProduitstoId(produitvalue!, produitlist!).toString());
                                                       // getProductsids(controllerids);
                                                        // addClientModel.notifyLis();
                                                      },
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
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
                                                  controller: produitsremise![i],
                                                  decoration: const InputDecoration(
                                                      hintText: "Remise",
                                                      suffixIcon: Icon(Icons.code,size: 18,)
                                                  ),
                                                ),
                                              )),
                                        ),
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
                            FlatButton(onPressed: (){
                              incremment_product();
                              print(nbr_products);
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


    print("idclient $itemid");
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


    print("idfournisseur $fournisseuritemid");
    return fournisseuritemid;

  }

  List<String> ProduitsNames(List<ProduitFacture_Model> produits) {
    List<String> names = new List<String>.empty(growable: true);
    for (int i = 0; i < produits.length; i++) names.add(produits[i].name!);
    return names;
  }

  int? ProduitstoId(String name,List<ProduitFacture_Model> produits){
    print('hhhhhh');
    print('name$name');
    for (int i = 0; i < produits.length; i++)
    {
      if(produits[i].name==name)
      {
        produititemid=produits[i].id;
      }
    }


    print("idproduits $produititemid");
    return produititemid;

  }

  int? incremment_product() {
    nbr_products=  nbr_products +1;
    managerdata.incriment=true;
    return nbr_products;


  }

  String? getProductsids (List<String> id){
    String myids="";
    //controllerids.add(id.toString());
    if(controllerids!=null){
    for(int i=0;i<controllerids.length; i++)
    {
      myids=myids+controllerids[i]+';';
      print('11111111$myids');
    }}
    if (myids != "" && myids.length > 0) {
      myids = myids.substring(0, myids.length - 1);
    }
    print('2222222$myids');
    return myids;


  }

  String? getProductsQte (List<TextEditingController> Quantite){
    String myqte="";
    print('sqli $myqte');
   for(int i =0;i< Quantite.length ; i++)
   {
     print('sqlf  ${Quantite[i].text}');
     if(Quantite[i].text != "" && Quantite.length>0 )
     {
       myqte=myqte + Quantite[i].text ;
       myqte=myqte+';';

     }
     print('sqli4 $myqte');
   }


    if (myqte != "" && myqte.length > 0) {
      myqte = myqte.substring(0, myqte.length - 1);
    }
    print('mmmm $myqte');
    return myqte;


  }

  String? getProductsremise (List<TextEditingController> Remise){
    String myremise="";
    print('remise $myremise');
    for(int i =0;i< Remise.length ; i++)
    {
      print('remise  ${Remise[i].text}');
      if(Remise[i].text != "" && Remise.length>0 )
      {
        myremise=myremise + Remise[i].text ;
        myremise=myremise+';';

      }
      print('remise $myremise');
    }


    if (myremise != "" && myremise.length > 0) {
      myremise = myremise.substring(0, myremise.length - 1);
    }
    print('mmmm $myremise');
    return myremise;


  }
  String? getProductsunite (List<String> unite){
    String myunity="";
    //controllerids.add(id.toString());
    if(unite!=null){
      for(int i=0;i<unite.length; i++)
      {
        myunity=myunity+unite[i]+';';
        print('11111111$unite');
      }}
    if (myunity != "" && myunity.length > 0) {
      myunity = myunity.substring(0, myunity.length - 1);
    }
    print('2222222$myunity');
    return myunity;


  }
}

