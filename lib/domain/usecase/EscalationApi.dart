import 'package:loansettle/domain/model/escalation/EscalationResponse.dart';

abstract class EscalationApi {
  Future<List<EscalationResponse>> getEscalationRequest();
}
