class BuildStructureModel {
  BuildStructureModel({
    required this.path,
    required this.fileName,
    required this.prefix,
  });

  String toPath() {
    return '$path/$fileName$prefix.dart';
  }

  @override
  String toString() {
    return '''
BuildStructureModel({
    path=$path,
    fileName=$fileName,
    prefix=$prefix,
});
''';
  }

  final String path;
  final String fileName;
  final String prefix;
}
