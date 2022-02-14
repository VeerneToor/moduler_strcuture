import 'package:moduler_structure/Contracts/Features/ReadParams/ReadParamsContract.dart';
import 'package:moduler_structure/Models/ParamsStateModel.dart';

class ReadParamsFeature extends ReadParamsContract {
  @override
  ParamsStateModel handler(List<String> param) {
    evalueParamsHandler(param);
    return ParamsStateModel(
      isEmptyModule: hasEmptyModuleParam,
      isPersonalizedConfig: hasPersonalizedModuleParam,
      personalizedConfigPath: personalizedConfigPath,
      featureName: featureName,
      moduleName: moduleName,
    );
  }
}
