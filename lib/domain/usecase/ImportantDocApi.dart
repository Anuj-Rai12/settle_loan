
import '../model/importantdocument/ImportantDocument.dart';

abstract class ImportantDocApi{

  Future<List<ImportantDocument>> getImpDoc();

}