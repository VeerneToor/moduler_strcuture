import 'dart:io';

import 'package:moduler_structure/Contracts/FeatureContract.dart';

abstract class FileWriterContract extends FeatureContract<dynamic, void> {
  Future<File> createFile(String filePath) async {
    final file = File(filePath);
    return file.create(recursive: true);
  }
}
