import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

bool isEmpty = false;

class FileOperations {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/statistics.json');
  }

  Future<File> writeToFile(String statics) async {
    final file = await _localFile;
    return file.writeAsString(statics.toString());
  }

  Future<String> readFromFile(String a) async {
    final file = await _localFile;
    final contents = await file.readAsString();
    var mapObject = jsonDecode(contents);
    return mapObject[0][a];
  }

  /*void deleteFromFile() async {
    final file = await _localFile;
    final contents = file.writeAsStringSync('');
  }*/
}
