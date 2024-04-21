
import 'package:loansettle/domain/model/benfitofPermiumPorgram/BenfitOfPermiumProgram.dart';

abstract class BenfitOfPremiumApi{

  Future<List<BenfitPermiumInstance>> getPremium();

}