import '../service/firestore_service.dart';

class LogController {
  static final LogController _instance = LogController._internal();

  factory LogController() {
    return _instance;
  }

  LogController._internal();

  final _firestoreDbService = FirestoreDbService();
}
