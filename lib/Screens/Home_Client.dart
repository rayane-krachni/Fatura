import 'package:flutter/material.dart';
import 'package:freelance/Items/client_item.dart';
import 'package:freelance/Model/Client/Client_Model.dart';
import 'package:freelance/Providers/Client_Management.dart';
import 'package:freelance/Querries/Client_session.dart';
import 'package:freelance/Screens/Creation/Add_Client.dart';
import 'package:freelance/Theme/Theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/pdf.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Home_Client extends StatefulWidget {
  const Home_Client({Key? key}) : super(key: key);

  @override
  State<Home_Client> createState() => _Home_ClientState();
}

class _Home_ClientState extends State<Home_Client> {
  Client_Manage manager= Client_Manage();
  List<Client_Model>? mmap;
  List<Client_Model>? FilterClient;
  TextEditingController? searchkey = TextEditingController();

  void getClients() async {
    List<Client_Model> res= await ClientSession.getAllData();
    mmap=res;
    //List<Client_Model> mmap = await (response as List).map((c) => Client_Model.fromMap(c)).toList();
    manager.loading=true;

  }
  @override
  void initState() {
    // TODO: implement initState
    getClients();
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    double _width=MediaQuery.of(context).size.width;
    double _height=MediaQuery.of(context).size.height;
    return ChangeNotifierProvider.value(
      value: manager,
      child:Consumer<Client_Manage>(builder: (context,client_manager,_){
        return Padding(
          padding: const EdgeInsets.only(top: 5.0,left: 20,right: 20,bottom: 20),
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
                    MaterialPageRoute(builder: (context) => Add_client()),
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
                    controller: searchkey,
                    onChanged: (value){
                      value=value.toLowerCase();
                      setState(() {
                        FilterClient=mmap!.where((c) {

                          var searchclient=c.fullname!.toLowerCase();
                          return searchclient.contains(value);

                        } ).toList();
                      });
                    },
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
              /*!client_manager.loading ?
                IconButton(icon:Icon(Icons.add_circle_outlined,size: 33,color: Colors.teal,), onPressed: () {   Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Add_client()),
                ); },):*/
              Expanded(
                  child: !client_manager.loading ?  const
                  Center(
                    child: SpinKitPouringHourGlassRefined  (
                      color: Colors.teal,
                      size: 50.0,
                      duration: const Duration(milliseconds: 12000),

                    ),
                  ) : mmap?.isEmpty ?? true ?  Center(
                    //
                      child: TextButton(child: Center(child: Text(' Clicker ici pour ajouter un client ')),onPressed: ()=>
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Add_client(),)
                          )))
                      : ListView.builder(
                    itemCount:searchkey!.text.isNotEmpty ? FilterClient!.length: mmap?.length,
                    itemBuilder:(BuildContext context,int i){

                      return ClientItem(client:searchkey!.text.isNotEmpty ? FilterClient![i]: mmap?[i],);
                    } ,
                  )
              )
            ],
          ),
        );
      }

      ),
    );
  }
}