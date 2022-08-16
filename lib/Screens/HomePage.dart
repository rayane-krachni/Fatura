
import 'package:flutter/material.dart';
import 'package:freelance/Querries/sharedpref.dart';
import 'package:freelance/Screens/Facture.dart';
import 'package:freelance/Screens/Fournisseur.dart';
import 'package:freelance/Screens/Home_Client.dart';
import 'package:freelance/Screens/homeProducts.dart';


import 'auth/authentification.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int SelectedIndex=0;
  static const   List<Widget> page=<Widget>[Home_Client(),Fournisseur(),Products(),Facture()];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /*drawer:  Drawer(
        child: GestureDetector(
          onTap: () async{

            Prefs.setBool('log', false);
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const Authentification()));

          },
          child: Container(
            child: Row(
              children: [
                Icon(Icons.logout),
                SizedBox(width: 20,),
                Text('Deconnexion')
              ],
            ),
          ),
        ),
      ),*/
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.teal),
        leading: IconButton(
          onPressed: ()async{

            Prefs.setBool('log', false);
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const Authentification()));

          },
          icon: Icon(Icons.logout),
        ),
      ),
      body: page[SelectedIndex],
      bottomNavigationBar:BottomNavigationBar(
        backgroundColor:Colors.transparent,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        currentIndex: SelectedIndex,
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Client',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Fournisseur',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits),
            label: 'Produits',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Facture',
          ),
        ],
        onTap: (int index){
          setState(() {
            SelectedIndex=index;
          });

        },
      ),
    );


  }
}

