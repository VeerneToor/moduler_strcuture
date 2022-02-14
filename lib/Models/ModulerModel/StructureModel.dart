import 'package:moduler_structure/Models/ModulerModel/SubFolderModel.dart';
import 'package:yaml/yaml.dart';

class StructureModel {
  StructureModel({
    required this.folder,
    required this.subFolders,
  });

  factory StructureModel.fromJson(YamlMap json) => StructureModel(
        folder: json['folder'],
        subFolders: List<YamlMap>.from(json['sub_folders'] ?? <dynamic>[])
            .map<SubFolderModel>((element) => SubFolderModel.fromJson(element)),
      );

  final String folder;
  final Iterable<SubFolderModel> subFolders;
}
