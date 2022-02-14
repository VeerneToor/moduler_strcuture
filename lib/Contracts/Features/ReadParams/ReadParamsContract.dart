import 'package:moduler_structure/Contracts/FeatureContract.dart';
import 'package:moduler_structure/Models/ParamsStateModel.dart';
import 'package:moduler_structure/Utils/constants.dart';

abstract class ReadParamsContract
    extends FeatureContract<List<String>, ParamsStateModel> {
  bool hasEmptyModuleParam = false;
  bool hasPersonalizedModuleParam = false;
  String featureName = '';
  String moduleName = '';
  String personalizedConfigPath = Constants.modulerConfigFile;

  String getParamValue(String param) {
    final entries = param.split('=');
    return entries.last;
  }

  void evalueParamsHandler(List<String> params) {
    final filteredValues = params.where((element) => element.startsWith('-'));

    for (var value in filteredValues) {
      final keyName = value[1];

      switch (keyName) {
        case 'e':
          hasEmptyModuleParam = true;
          break;
        case 'i':
          hasPersonalizedModuleParam = true;
          personalizedConfigPath = getParamValue(value);
          break;
        case 'f':
          featureName = getParamValue(value);
          break;
        case 'm':
          moduleName = getParamValue(value);
          break;
        default:
      }
    }
  }
}
