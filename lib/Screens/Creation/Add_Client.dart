import 'package:flutter/material.dart';
import 'package:freelance/Querries/Client_session.dart';
import 'package:freelance/Screens/HomePage.dart';
import 'package:freelance/Screens/Home_Client.dart';
import 'package:freelance/widgets/Success_Diag.dart';

import '../../Theme/Theme.dart';

class Add_client extends StatefulWidget {
  const Add_client({Key? key}) : super(key: key);

  @override
  State<Add_client> createState() => _Add_clientState();
}

class _Add_clientState extends State<Add_client> {
  TextEditingController ? name_control,address_control,willaya_control,activity_control,nic_control,nif_control,art_control,rc_control,phone_control;

  @override
  void initState() {
    // TODO: implement initState
    name_control= new TextEditingController();
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
  String get Address => address_control!.text;
  String get willaya => willaya_control!.text;
  String get activite => activity_control!.text;
  String get nic => nic_control!.text;
  String get nif => nif_control!.text;
  String get art => art_control!.text;
  String get rc => rc_control!.text;
  int get phone => int.parse(phone_control!.text);

  void Insert_Client()async {

    int insrtcleint=   await ClientSession.AddClient( name,Address, willaya,  activite,  nic,  nif,  art,  rc,  phone);
    if( insrtcleint!= 0)
    {
      showDialog(context: context, builder:(_)=>Success_Dialog(mytext: "Client done",mywidgets :()=> HomePage()));
    }
    else {
      print('results $insrtcleint');
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
                              padding: const EdgeInsets.only(top:1.0,left: 15,right: 5,bottom:12),
                              child: TextFormField(
                                controller: phone_control,
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
                                    hintText: "Addres",
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
                    onPressed: ()  {
                       Insert_Client();
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
