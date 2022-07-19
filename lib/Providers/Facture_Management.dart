
import 'package:flutter/cupertino.dart';

class Facture_Manage extends ChangeNotifier {

  bool _loadingfacture=false;

  bool get loadingfacture =>  _loadingfacture;

  set loadingfacture(bool value){
    _loadingfacture = value;
    notifyListeners();
  }
  bool _loadcproduitpdf=false;

  bool get loadcproduitpdf =>  _loadcproduitpdf;

  set loadcproduitpdf(bool value){
    _loadcproduitpdf = value;
    notifyListeners();
  }

  bool _loadclientpdf=false;

  bool get loadclientpdf =>  _loadclientpdf;

  set loadclientpdf(bool value){
    _loadclientpdf = value;
    notifyListeners();
  }

  bool _loadfournisspdf=false;

  bool get loadfournisspdf =>  _loadfournisspdf;

  set loadfournisspdf(bool value){
    _loadfournisspdf = value;
    notifyListeners();
  }


  bool _loadingclient=false;

  bool get loadingclient =>  _loadingclient;

  set loadingclient(bool value){
    _loadingclient = value;
    notifyListeners();
  }

  bool _loadingfournisseur=false;

  bool get loadingfournisseur =>  _loadingfournisseur;

  set loadingfournisseur(bool value){
    _loadingfournisseur = value;
    notifyListeners();
  }

  bool _loadingproduits=false;

  bool get loadingproduits =>  _loadingproduits;

  set loadingproduits(bool value){
    _loadingproduits = value;
    notifyListeners();
  }

  bool _incriment=false;

  bool get incriment =>  _incriment;

  set incriment(bool value){
    _incriment = value;
    notifyListeners();
  }

  notifyListeners();

}