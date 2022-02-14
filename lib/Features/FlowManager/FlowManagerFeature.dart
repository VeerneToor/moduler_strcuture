import 'package:moduler_structure/Contracts/FeatureContract.dart';
import 'package:moduler_structure/Contracts/Features/BuildStructure/BuildStructureContract.dart';
import 'package:moduler_structure/Contracts/Features/FileWriter/FileWriterContract.dart';
import 'package:moduler_structure/Contracts/Features/ReadConfigFile/ReadConfigFileContract.dart';
import 'package:moduler_structure/Contracts/Features/ReadParams/ReadParamsContract.dart';
import 'package:moduler_structure/Exceptions/FlowException.dart';
import 'package:moduler_structure/Extensions/IterableExtension.dart';
import 'package:moduler_structure/Models/BuildStructureModel/BuildStructureModel.dart';
import 'package:moduler_structure/Models/ModulerModel/ModulerModel.dart';
import 'package:moduler_structure/Provider/Provider.dart';

class FlowManagerFeature extends FeatureContract<List<String>, void> {
  final readParamsFeature = modulerProvider.get<ReadParamsContract>();
  final readConfigFileFeature = modulerProvider.get<ReadConfigFileContract>();
  final buildStructureFeature = modulerProvider.get<BuildStructureContract>();
  final fileWriterFeature = modulerProvider.get<FileWriterContract>();

  Future writeStructures({
    required List<BuildStructureModel> structures,
    required String prefixPath,
  }) async {
    return Future.wait(
      structures.map((structure) {
        final path = structure.toPath();
        return fileWriterFeature.createFile('$prefixPath/$path');
      }),
    );
  }

  @override
  void handler(List<String> param) {
    final readParams = readParamsFeature.handler(param);
    final moduler = readConfigFileFeature.handler(readParams);

    final module = moduler.modules.optionalSingle<Module>(
      (element) => element.name == readParams.moduleName,
    );

    if (module == null) {
      throw FlowException(
        'El modulo ${readParams.moduleName} no se encontro en ${readParams.personalizedConfigPath}',
      );
    }

    final instructions = buildStructureFeature.handler(
      module,
      readParams.featureName,
    );

    writeStructures(
      structures: instructions,
      prefixPath: moduler.prefixStructure,
    ).then((dynamic value) {
      print('La estructura ha sido creada correctamente');
    });
  }
}
