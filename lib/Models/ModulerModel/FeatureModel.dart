import 'package:yaml/yaml.dart';

class FeatureModel {
  FeatureModel({
    required this.folder,
    required this.inSubfolder,
    required this.sufix,
  });

  factory FeatureModel.fromJson(YamlMap json) => FeatureModel(
        folder: json['folder'],
        inSubfolder:
            List<String>.from(getIterable(json['in_subfolder'])).map((e) => e),
        sufix: json['sufix'] ?? '',
      );

  static List<dynamic> getIterable(dynamic value) {
    if (value == null) {
      return <dynamic>[];
    }

    return value;
  }

  final String folder;
  final Iterable<String> inSubfolder;
  final String sufix;
}
