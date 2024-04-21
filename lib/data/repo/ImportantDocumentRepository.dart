import 'dart:convert';

import 'package:loansettle/domain/usecase/ImportantDocApi.dart';
import 'package:http/http.dart' as http;
import 'package:loansettle/utils/FilesUtils.dart';
import '../../domain/model/importantdocument/ImportantDocument.dart';

class ImportantDocumentRepository extends ImportantDocApi {
  @override
  Future<List<ImportantDocument>> getImpDoc() async {
    var request = http.Request(
        'GET', Uri.parse('${ApiUrl.baseurl}${ApiUrl.importantDocEndPoint}'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var value = (await response.stream.bytesToString());
      final List<dynamic> jsonDecode = json.decode(value);
      return jsonDecode.map((e) => ImportantDocument.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
