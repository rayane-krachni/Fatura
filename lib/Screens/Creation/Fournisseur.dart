import 'package:flutter/material.dart';

import '../../Theme/Theme.dart';

class AddFournisseurs extends StatefulWidget {
  const AddFournisseurs({Key? key}) : super(key: key);

  @override
  State<AddFournisseurs> createState() => _AddFournisseursState();
}

class _AddFournisseursState extends State<AddFournisseurs> {
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
              SizedBox(
                width: _width,
                height: _height*0.06,
                child: RaisedButton(
                  onPressed: () {  },
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),

                  ),
                  color: Colors.teal,
                  child: Text("Ajouter",style: ThemeStyle.buttontext,),

                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
