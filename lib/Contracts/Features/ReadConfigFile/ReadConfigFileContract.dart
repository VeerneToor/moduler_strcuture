import 'dart:io';

import 'package:moduler_structure/Contracts/FeatureContract.dart';
import 'package:moduler_structure/Models/ModulerModel/ModulerModel.dart';
import 'package:moduler_structure/Models/ParamsStateModel.dart';
import 'package:yaml/yaml.dart';

abstract class ReadConfigFileContract
    extends FeatureContract<ParamsStateModel, ModulerModel> {
  bool existConfigFile(String path) {
    final file = File(path);
    return file.existsSync();
  }

  ModulerModel readConfigFile(String path) {
    final file = File(path);
    final readedFile = file.readAsStringSync();

    final YamlMap parsedYaml = loadYaml(readedFile);

    return ModulerModel.fromJson(parsedYaml);
  }
}
