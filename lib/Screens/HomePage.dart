
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:freelance/Screens/Facture.dart';
import 'package:freelance/Screens/Fournisseur.dart';
import 'package:freelance/Screens/Home_Client.dart';
import 'package:freelance/Screens/Products.dart';
import 'package:freelance/Theme/Theme.dart';
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
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.teal)
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

