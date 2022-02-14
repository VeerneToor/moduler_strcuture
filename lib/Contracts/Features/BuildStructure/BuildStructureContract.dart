import 'package:moduler_structure/Models/BuildStructureModel/BuildStructureModel.dart';
import 'package:moduler_structure/Models/ModulerModel/ModulerModel.dart';

abstract class BuildStructureContract {
  String buildPath({
    required String path,
    required String fileName,
    String extension = 'dart',
  }) {
    return '$path/$fileName.$extension';
  }

  List<BuildStructureModel> handler(Module moduler, String featureName);
}
