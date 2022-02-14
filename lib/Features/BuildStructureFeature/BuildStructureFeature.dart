import 'package:moduler_structure/Contracts/Features/BuildStructure/BuildStructureContract.dart';
import 'package:moduler_structure/Exceptions/FlowException.dart';
import 'package:moduler_structure/Extensions/IterableExtension.dart';
import 'package:moduler_structure/Models/BuildStructureModel/BuildStructureModel.dart';
import 'package:moduler_structure/Models/ModulerModel/StructureModel.dart';
import 'package:moduler_structure/Models/ModulerModel/SubFolderModel.dart';

class BuildStructureFeature extends BuildStructureContract {
  final structureModels = <BuildStructureModel>[];

  StructureModel? searchOptional(
      Iterable<StructureModel> items, String compareTo) {
    final response = items.optionalSingle<StructureModel>(
      (element) => element.folder == compareTo,
    );

    if (response == null) {
      throw FlowException(
        'La carpeta $compareTo no existe dentro de la estructura del modelo',
      );
    }

    return response;
  }

  @override
  List<BuildStructureModel> handler(moduler, featureName) {
    final modules = moduler.feature;

    for (var module in modules) {
      final folder = module.folder;

      /// Identificar si el folder del [Feature] tiene relacion con
      /// la estructura del modelo
      final folderRelation = searchOptional(moduler.structure, folder);

      /// Identificar si un Feature fue elegido para crearse con
      /// sub carpetas
      if (module.inSubfolder.isNotEmpty) {
        for (var subfolder in module.inSubfolder) {
          final subFolderRelation = folderRelation!.subFolders
              .optionalSingle<SubFolderModel>((element) {
            return element.name == subfolder;
          });

          if (subFolderRelation == null) {
            throw FlowException(
              'La sub-carpeta $subfolder no esta dentro del listado de: ${folderRelation.folder} ${folderRelation.subFolders}',
            );
          }

          final item = BuildStructureModel(
            fileName: featureName,
            path: '${folderRelation.folder}/${subFolderRelation.name}',
            prefix: subFolderRelation.sufix,
          );
          structureModels.add(item);
        }
      } else {
        final item = BuildStructureModel(
          fileName: featureName,
          path: module.folder,
          prefix: module.sufix,
        );
        structureModels.add(item);
      }
    }

    return structureModels;
  }
}
