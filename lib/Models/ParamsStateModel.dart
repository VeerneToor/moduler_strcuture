class ParamsStateModel {
  ParamsStateModel({
    required this.isEmptyModule,
    required this.isPersonalizedConfig,
    required this.featureName,
    required this.moduleName,
    this.personalizedConfigPath,
  });
  // : assert(isPersonalizedConfig && personalizedConfigPath == null,
  //           'Debes Ingresar un PathConfig');

  factory ParamsStateModel.from({
    required bool isEmptyModule,
    required bool isPersonalizedConfig,
    required String featureName,
    required String moduleName,
    String? personalizedConfigPath,
  }) {
    return ParamsStateModel(
      isEmptyModule: isEmptyModule,
      isPersonalizedConfig: isPersonalizedConfig,
      personalizedConfigPath: personalizedConfigPath,
      featureName: featureName,
      moduleName: moduleName,
    );
  }

  final bool isEmptyModule;
  final bool isPersonalizedConfig;
  final String featureName;
  final String moduleName;
  final String? personalizedConfigPath;
}
