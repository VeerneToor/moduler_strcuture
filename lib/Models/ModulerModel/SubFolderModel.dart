import 'package:yaml/yaml.dart';

class SubFolderModel {
  SubFolderModel({
    required this.name,
    this.sufix = '',
  });

  factory SubFolderModel.fromJson(YamlMap json) => SubFolderModel(
        name: json['name'],
        sufix: json['sufix'] ?? '',
      );

  final String name;
  final String sufix;
}
