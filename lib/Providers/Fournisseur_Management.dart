
import 'package:flutter/material.dart';

class Fournisseur_Manage extends ChangeNotifier {

  bool _fournisseur=false;

  bool get fournisseur =>  _fournisseur;

  set fournisseur(bool value){
    _fournisseur = value;
    notifyListeners();
  }

  notifyListeners();

}