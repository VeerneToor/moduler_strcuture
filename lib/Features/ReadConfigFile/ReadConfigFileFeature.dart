import 'package:moduler_structure/Contracts/Features/ReadConfigFile/ReadConfigFileContract.dart';
import 'package:moduler_structure/Exceptions/FlowException.dart';
import 'package:moduler_structure/Models/ModulerModel/ModulerModel.dart';
import 'package:moduler_structure/Models/ParamsStateModel.dart';
import 'package:moduler_structure/Utils/constants.dart';

class ReadConfigFileFeature extends ReadConfigFileContract {
  String configPath = Constants.modulerConfigFile;

  @override
  ModulerModel handler(ParamsStateModel param) {
    if (param.isPersonalizedConfig) {
      configPath = param.personalizedConfigPath!;
    }

    final existFile = existConfigFile(configPath);

    if (!existFile) {
      throw FlowException(
        'El archivo de configuracion no existe o no fue encontrado',
      );
    }

    final parsedYaml = readConfigFile(configPath);

    return parsedYaml;
  }
}
