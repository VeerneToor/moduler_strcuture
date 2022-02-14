import 'package:moduler_structure/Models/ModulerModel/FeatureModel.dart';
import 'package:moduler_structure/Models/ModulerModel/StructureModel.dart';
import 'package:yaml/yaml.dart';

class ModulerModel {
  ModulerModel({
    required this.prefixStructure,
    required this.modules,
  });

  factory ModulerModel.fromJson(YamlMap json) => ModulerModel(
        prefixStructure: json['prefix_structure'],
        modules: List<YamlMap>.from(json['modules'])
            .map<Module>((element) => Module.fromJson(element)),
      );

  final String prefixStructure;
  final Iterable<Module> modules;
}

class Module {
  Module({
    required this.name,
    required this.structure,
    required this.feature,
  });

  factory Module.fromJson(YamlMap json) => Module(
        name: json['name'],
        structure: List<YamlMap>.from(json['structure'])
            .map<StructureModel>((element) => StructureModel.fromJson(element)),
        feature: List<YamlMap>.from(json['feature'])
            .map<FeatureModel>((element) => FeatureModel.fromJson(element)),
      );

  final String name;
  final Iterable<StructureModel> structure;
  final Iterable<FeatureModel> feature;
}
