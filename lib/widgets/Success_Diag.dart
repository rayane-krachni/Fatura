import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance/Screens/HomePage.dart';

class Success_Dialog extends StatefulWidget {
  final String? mytext;
  final Widget Function()? mywidgets;
  const Success_Dialog({Key? key , this.mytext,this.mywidgets}) : super(key: key);

  @override
  _Success_DialogState createState() => _Success_DialogState();
}

class _Success_DialogState extends State<Success_Dialog> {
  @override
  Widget build(BuildContext context) {
    double _width=MediaQuery.of(context).size.width;
    double _height=MediaQuery.of(context).size.height;
    double padding_top= _height*0.11;
    return WillPopScope(
      onWillPop: () async{
      return false;
      },
         child: Dialog(

           backgroundColor: Colors.transparent,
           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(12.0)),
           child: Container(
             height: _height*0.3,
             margin: EdgeInsets.all(0),
             child: Stack(
               children: <Widget>[
                 Container(
                   width: double.infinity,
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(12.0),
                   ),
                   child: Padding(
                     padding: const EdgeInsets.only(top:100 ),
                     child: Column(
                       children: [
                         Text(widget.mytext!),
                         FlatButton(onPressed: (){
                           Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => widget.mywidgets!()));
                         }, child: Text('click to dismiss'))
                       ],
                     ),
                   ),
                 ),
                 Align(
                   // These values are based on trial & error method
                   alignment: Alignment(0.02, -1.3),
                   child: InkWell(
                     onTap: () {
                       Navigator.pop(context);
                     },
                     child: Container(
                       decoration: BoxDecoration(
                         color: Colors.teal,
                         borderRadius: BorderRadius.all(Radius.circular(50)),
                       ),
                       child: Icon(
                         Icons.check,
                         color: Colors.white,
                         size: _height*0.11,
                       ),
                     ),
                   ),
                 ),
               ],
             ),
           ),
         ),
    );

                  
  }
}

