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
  bool _validatename= false;
  Color First=Colors.black12;
  Color second=Colors.grey;

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
      showDialog(context: context, builder:(_)=>Success_Dialog(mytext: "Le nouveau client a ete bien ajoutee",mywidgets :()=> HomePage()));
    }
    else {

    }

  }

  final formkey =GlobalKey<FormState>();

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
                  child: Text("Ajouter un  client",style: ThemeStyle.addtitles,)),
              const SizedBox(height: 5,),
              Align(

                  alignment: Alignment.topLeft,
                  child: Text("Svp Remplir tous les champs necessaires",style: ThemeStyle.secondtitle,)),
              const SizedBox(height: 10,),
              Form(
                  key: formkey,
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
                                validator: (value){
                                  if(value==null || value.isEmpty)
                                  {
                                    return 'Remplir le champ';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  // errorText: (name_control.text.isEmpty) ?? true ? 'cant be  nuull': null,
                                  hintText: "Nom",
                                  suffixIcon:  Icon(Icons.person,size: 18,),
                                  errorBorder: InputBorder.none,
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
                                validator: (value){
                                  if(value==null || value.isEmpty)
                                  {
                                    return 'Remplir le champ';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  hintText: "Tel phone",
                                  suffixIcon:  Icon(Icons.phone,size: 18,),
                                  errorBorder: InputBorder.none,
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
                                validator: (value){
                                  if(value==null || value.isEmpty)
                                  {
                                    return 'Remplir le champ';
                                  }
                                  return null;
                                },
                                decoration:const InputDecoration(
                                  hintText: "Addres",
                                  suffixIcon: Icon(Icons.add_location,size: 18,),
                                  errorBorder: InputBorder.none,

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
                                validator: (value){
                                  if(value==null || value.isEmpty)
                                  {
                                    return 'Remplir le champ';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  hintText: "Wilaya",
                                  suffixIcon: Icon(Icons.location_city,size: 18,),
                                  errorBorder: InputBorder.none,
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
                                validator: (value){
                                  if(value==null || value.isEmpty)
                                  {
                                    return 'Remplir le champ';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  hintText: "Nic",
                                  suffixIcon: Icon(Icons.code,size: 18,),
                                  errorBorder: InputBorder.none,
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
                                borderRadius: const BorderRadius.all(Radius.circular(15)),
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
                                validator: (value){
                                  if(value==null || value.isEmpty)
                                  {
                                    return 'Remplir le champ';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  hintText: "Nif",
                                  suffixIcon: Icon(Icons.code,size: 18,),
                                  errorBorder: InputBorder.none,
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
                                validator: (value){
                                  if(value==null || value.isEmpty)
                                  {
                                    return 'Remplir le champ';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  hintText: "Rc",
                                  suffixIcon: Icon(Icons.code,size: 18,),
                                  errorBorder: InputBorder.none,
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
                                validator: (value){
                                  if(value==null || value.isEmpty)
                                  {
                                    return 'Remplir le champ';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  hintText: "Art",
                                  suffixIcon: Icon(Icons.code,size: 18,),
                                  errorBorder: InputBorder.none,
                                ),
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7.0),
                        child: Container(

                            height: _height*0.08,
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
                              padding: const EdgeInsets.only(top:1.0,left: 15,right: 5),
                              child: TextFormField(
                                maxLines: 3,
                                controller: activity_control,
                                validator: (value){
                                  if(value==null || value.isEmpty)
                                  {
                                    return 'Remplir le champ';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  hintMaxLines: 4 ,
                                  hintText: "activite ",

                                  errorBorder: InputBorder.none,


                                  suffixIcon: Icon(Icons.work,size: 18,),


                                ),
                              ),
                            )),
                      ),
                    ],
                  )),
              const SizedBox(height: 20,),
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

                child: RaisedButton(
                    disabledColor: Colors.grey,
                    color: Colors.transparent ,
                    onPressed: ()  {

                      if  (  name.isEmpty||
                          Address.isEmpty||
                          willaya.isEmpty||
                          activite.isEmpty||
                          nic.isEmpty||
                          nif.isEmpty||
                          art.isEmpty||
                          rc.isEmpty||
                          phone==''){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Remplir Les Champs Svp ')));
                      }
                      return Insert_Client();
                    },



                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                    //style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
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