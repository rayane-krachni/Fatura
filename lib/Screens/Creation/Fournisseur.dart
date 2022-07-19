import 'package:flutter/material.dart';
import 'package:freelance/Querries/Fournisseur_Session.dart';
import 'package:freelance/Screens/Fournisseur.dart';
import 'package:freelance/Screens/HomePage.dart';
import 'package:freelance/widgets/Wrong_Diag.dart';

import '../../Querries/Facture_Session.dart';
import '../../Theme/Theme.dart';
import '../../widgets/Success_Diag.dart';

class AddFournisseurs extends StatefulWidget {
  const AddFournisseurs({Key? key}) : super(key: key);

  @override
  State<AddFournisseurs> createState() => _AddFournisseursState();
}

class _AddFournisseursState extends State<AddFournisseurs> {
  TextEditingController ? name_control,company_control,address_control,willaya_control,activity_control,nic_control,nif_control,art_control,rc_control,phone_control;

  @override
  void initState() {
    // TODO: implement initState
    name_control= new TextEditingController();
    company_control=new TextEditingController();
    address_control= new TextEditingController();
    willaya_control= new TextEditingController();
    activity_control= new TextEditingController();
    nic_control= new TextEditingController();
    nif_control= new TextEditingController();
    art_control= new TextEditingController();
    rc_control= new TextEditingController();
    phone_control= new TextEditingController();
  }
  String get name => name_control!.text;
  String get company => company_control!.text;
  String get Address => address_control!.text;
  String get willaya => willaya_control!.text;
  String get activite => activity_control!.text;
  String get nic => nic_control!.text;
  String get nif => nif_control!.text;
  String get art => art_control!.text;
  String get rc => rc_control!.text;
  int get phone => int.parse(phone_control!.text);

  void Insert_Fournisseur()async {

    int insrtcleint= await FournisseurSession.AddFournisseur(name,company, Address, willaya, activite, nic, nif, art, rc, phone);
    if( insrtcleint!= 0)
    {
      print('hgjgh');
    //  showDialog(context: context, builder:(_)=> Wrong_Dialog());

     showDialog(context: context, builder:(_)=> Success_Dialog(mytext: "Le nouveau Founisseur a ete bien ajoutee",mywidgets:()=>HomePage()));
    }
    else {
      print('results $insrtcleint');
      showDialog(context: context, builder:(_)=> Wrong_Dialog());

    }

  }
  @override
  Widget build(BuildContext context) {
    double _width=MediaQuery.of(context).size.width;
    double _height=MediaQuery.of(context).size.height;
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
                  child: Text("Ajouter un  Fournisseur",style: ThemeStyle.addtitles,)),
              const SizedBox(height: 5,),
              Align(

                  alignment: Alignment.topLeft,
                  child: Text("Svp Remplir tous les champs necessaire",style: ThemeStyle.secondtitle,)),
              const SizedBox(height: 10,),
              Form(
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
                              padding: const EdgeInsets.only(top:1.0,left: 15,right: 5,bottom: 6),
                              child: TextFormField(
                                controller: name_control,
                                decoration: const InputDecoration(
                                  hintText: "Nom",
                                  suffixIcon:  Icon(Icons.person,size: 18,),
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
                              padding: const EdgeInsets.only(top:1.0,left: 15,right: 5,bottom: 6),
                              child: TextFormField(
                                controller: company_control,
                                decoration: const InputDecoration(
                                  hintText: "Entreprise",
                                  suffixIcon:  Icon(Icons.home_work_sharp,size: 18,),
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
                                controller: phone_control,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  hintText: "Tel phone",
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
                                controller: address_control,
                                decoration: InputDecoration(
                                    hintText: "Addreds",
                                    suffixIcon: Icon(Icons.add_location,size: 18,)
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
                                controller: willaya_control,
                                decoration: InputDecoration(
                                    hintText: "Wilaya",
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
                                controller: nic_control,
                                decoration: InputDecoration(
                                    hintText: "Nic",
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
                                controller: nif_control,
                                decoration: InputDecoration(
                                    hintText: "Nif",
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
                                controller: rc_control,
                                decoration: InputDecoration(
                                    hintText: "Rc",
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
                                controller: art_control,
                                decoration: InputDecoration(
                                    hintText: "Art",
                                    suffixIcon: Icon(Icons.code,size: 18,)
                                ),
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7.0),
                        child: Container(

                            height: _height*0.06,
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
                                controller: activity_control,
                                decoration: const InputDecoration(
                                  hintMaxLines: 4 ,
                                  hintText: "activite ",
                                  suffixIcon: Icon(Icons.work,size: 18,),

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
                     if  (  name.isEmpty||
                                company.isEmpty||
                                Address.isEmpty||
                                willaya.isEmpty||
                                activite.isEmpty||
                                nic.isEmpty||
                                nif.isEmpty||
                                art.isEmpty||
                                rc.isEmpty||
                                phone==''){
                       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Empty fields ')));
                     }
                      return Insert_Fournisseur();
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
  }
}
