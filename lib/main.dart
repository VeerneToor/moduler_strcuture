import 'package:moduler_structure/Contracts/Features/BuildStructure/BuildStructureContract.dart';
import 'package:moduler_structure/Contracts/Features/FileWriter/FileWriterContract.dart';
import 'package:moduler_structure/Contracts/Features/ReadConfigFile/ReadConfigFileContract.dart';
import 'package:moduler_structure/Contracts/Features/ReadParams/ReadParamsContract.dart';
import 'package:moduler_structure/Features/BuildStructureFeature/BuildStructureFeature.dart';
import 'package:moduler_structure/Features/FileWriterFeature/FileWriterFeature.dart';
import 'package:moduler_structure/Features/FlowManager/FlowManagerFeature.dart';
import 'package:moduler_structure/Features/ReadConfigFile/ReadConfigFileFeature.dart';
import 'package:moduler_structure/Features/ReadParams/ReadParamsFeature.dart';
import 'package:moduler_structure/Provider/Provider.dart';
import 'package:moduler_structure/Utils/utils.dart';

void main(List<String> arguments) {
  modulerProvider.set<ReadParamsContract>(ReadParamsFeature());
  modulerProvider.set<ReadConfigFileContract>(ReadConfigFileFeature());
  modulerProvider.set<BuildStructureContract>(BuildStructureFeature());
  modulerProvider.set<FileWriterContract>(FileWriterFeature());

  final introMessage = Utils().getIntroMessage();
  print(introMessage);

  return FlowManagerFeature().handler(arguments);
}
