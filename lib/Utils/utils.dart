import 'package:moduler_structure/Utils/constants.dart';

class Utils extends Constants {
  String getIntroMessage() {
    return '''
════════════════════════════════════════════
          FLUTTER MODULER CREATOR                               
════════════════════════════════════════════

flutter moduler $createCommand

flutter moduler $createParamsCommand

$paramsDisclaimerCommand
════════════════════════════════════════════
          ''';
  }
}
