import '/model/enum/doc_name.dart';
import '/model/enum/extension/extension_doc_name.dart';
import '../service/firestore_service.dart';

class LogDbController {
  static final LogDbController _instance = LogDbController._internal();

  factory LogDbController() {
    return _instance;
  }

  LogDbController._internal();

  final _firestoreDbService = FirestoreDbService();

  Future<void> addLog(Map<String, dynamic> log) async {
    await _firestoreDbService.addData(
      docName: DocName.logs.stringDefinition,
      data: log,
    );
  }
}
