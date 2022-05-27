

import 'package:flutter/material.dart';

class Produit_Manage extends ChangeNotifier{


  bool _produits=false;
  bool get produits=> _produits;
  void set produits(bool value)
  {
    _produits=value;

    notifyListeners();
  }
  notifyListeners();
}