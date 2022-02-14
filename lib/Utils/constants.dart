class Constants {
  final String moduleVersion = '1.0.0';
  static String modulerConfigFile = 'moduler-config.yaml';
  final String createCommand = 'create-module {name}';
  final String createParamsCommand = 'create-module {name} {e | i | f | m}';
  final String paramsDisclaimerCommand = '''
Params:
  -e => Create Module without Code, empty file
  __________________________________________________
  -i => Specify $modulerConfigFile Path
  -i=moduler-config.dev.yaml
  ___________________________________________________
  -f => Specify Feature Name
  -f=Login
  ___________________________________________________
  -m => Specify Module to Create
  -m=CLEAN
  ___________________________________________________
''';
}
