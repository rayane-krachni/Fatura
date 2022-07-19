import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:provider/provider.dart';

class PdfApi{

  static Future<File> saveDocument({
  required String name,
  required Document pdf,
  })async {
    //final bytes=await pdf.save();
    final dir = await getApplicationDocumentsDirectory();
    final file =File('${dir.path}/$name');
    await file.writeAsBytes(await pdf.save());
    return file;


  }
  static Future openFile(File file) async {
    //file.deleteSync();
    final url = file.path;

    await OpenFile.open(url);
  }

  static Future existed(File file) async {
    if(file.existsSync() == true) {
      file.deleteSync();
      //  file.dispose();
    }
  }
}