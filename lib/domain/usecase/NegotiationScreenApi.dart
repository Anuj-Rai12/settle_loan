

import 'package:loansettle/domain/model/negoationstatus/NegotiationStatusResponse.dart';

abstract class NegotiationScreenApi {

  Future<List<NegotiationStatus>> getNegotiationStatus(int clientId);

}