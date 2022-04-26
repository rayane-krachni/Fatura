
import 'package:flutter/material.dart';
import 'package:freelance/Screens/Creation/Client.dart';
import 'package:freelance/Theme/Theme.dart';
import 'package:google_fonts/google_fonts.dart';

class Client extends StatefulWidget {
  const Client({Key? key}) : super(key: key);

  @override
  State<Client> createState() => _ClientState();
}

class _ClientState extends State<Client> {

  @override
  Widget build(BuildContext context) {
    double _width=MediaQuery.of(context).size.width;
    double _height=MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Text("Session des Clients  !",style:  ThemeStyle.initialtitle)),
              IconButton(icon:Icon(Icons.add_circle_outlined,size: 33,color: Colors.teal,), onPressed: () {   Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Add_Client()),
              ); },)
            ],
          ),
          const SizedBox(height: 5,),
          Text("Dans cette vous pouvez consulter , modifier et suprimer votre clients",style: ThemeStyle.secondtitle,),
          Padding(
            padding: const EdgeInsets.only(top: 10.0,bottom: 10),
            child: Container(

              height: _height*0.06,
              width: double.infinity,
              decoration:  BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [BoxShadow(
                    blurRadius:5 ,
                    color: Colors.grey.withOpacity(0.2),
                    offset: Offset(0,3)
                )]
              ),
              child: TextFormField(
                decoration:  InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'Recherche',
                    helperStyle: GoogleFonts.lato(color:ThemeStyle.muted,fontSize: 9 ),
                    prefixIcon: Icon(Icons.search_rounded),

                ),

              ),
            ),
          ),
          Expanded(

                child: ListView.builder(
                    itemCount: 30,
                     itemBuilder:(BuildContext context,int index){
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          height: _height*0.1,
                          decoration:  BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              boxShadow: [BoxShadow(
                                  blurRadius:5 ,
                                  color: Colors.grey.withOpacity(0.2),
                                  offset: Offset(0,3)
                              )]
                          ),
                          child:  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:  [
                                  Row(
                                    children:  [
                                      const CircleAvatar(
                                      backgroundImage: AssetImage("assets/images/client.jpg",),
                                        radius: 25,
                                    ),
                                      const SizedBox(width:20 ,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15.0),
                                        child: Column(
                                         mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children:  [
                                            Text("Client Name",style: GoogleFonts.lato(color:Colors.black,fontSize: 15,fontWeight: FontWeight.bold ),),
                                            SizedBox(height: 4.0,),
                                            Text("Wilaya",style: GoogleFonts.lato(color:Colors.black54,fontSize: 12,fontWeight: FontWeight.bold ),)
                                          ],
                                        ),
                                      )

                                      ,],
                                  ),
                                  Icon(Icons.navigate_next,size: 33,color: Colors.teal,)

                                ],
                              ),
                          ),

                        ),
                      );
                     } ,
                ),
              )
        ],
      ),
    );
  }
}
