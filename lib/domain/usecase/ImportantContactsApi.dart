import 'package:loansettle/domain/model/contacts/ImportantContactsResponse.dart';

abstract class ImportantContactsApi {

  Future<List<ImportantContacts>> importantContact();

}
