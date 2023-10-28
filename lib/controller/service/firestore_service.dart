import 'package:firedart/firedart.dart';
import 'package:stok_takibi_masaustu/model/enum/extension/extension_doc_name.dart';

import '../../model/enum/doc_name.dart';
import '/model/enum/extension/extension_log_state.dart';
import '/model/enum/log_state.dart';
import '/model/data/log.dart';

class FirestoreDbService {
  static final FirestoreDbService _instance = FirestoreDbService._internal();
  static const String dbName = 'stok-takibi';
  late DocumentReference _db;

  factory FirestoreDbService({String? id}) {
    if (id == null) {
      return _instance;
    }
    return _instance.._db = Firestore.instance.collection(id).document(dbName);
  }

  FirestoreDbService._internal();

  Future<Page<Document>?> getPage({required String collectName}) async {
    Page<Document>? page;
    final CollectionReference ref = _db.collection(collectName);
    try {
      page = await ref.get();
    } on Exception catch (e) {
      Log log = Log(
        dateTime: DateTime.now(),
        state: LogState.getData.stringDefinition,
        message: e.toString(),
      );

      addData(collectName: DocName.logs.stringDefinition, data: log.toMap());
    }
    return page;
  }

  Future<Document?> addData({
    required String collectName,
    required Map<String, dynamic> data,
  }) async {
    Document? document;
    try {
      document = await _db.collection(collectName).add(data);
    } on Exception catch (e) {
      Log log = Log(
        dateTime: DateTime.now(),
        state: LogState.addData.stringDefinition,
        message: e.toString(),
      );

      addData(collectName: DocName.logs.stringDefinition, data: log.toMap());
    }

    return document;
  }

  Future<Document?> getData({
    required String collectName,
    required String id,
  }) async {
    Document? document;
    try {
      document = await _db.collection(collectName).document(id).get();
    } on Exception catch (e) {
      Log log = Log(
        dateTime: DateTime.now(),
        state: LogState.getData.stringDefinition,
        message: e.toString(),
      );

      addData(collectName: DocName.logs.stringDefinition, data: log.toMap());
    }

    return document;
  }

  Future<bool> updateData({
    required String collectName,
    required String id,
    required Map<String, dynamic> data,
  }) async {
    bool state = true;
    try {
      await _db.collection(collectName).document(id).update(data);
    } on Exception catch (e) {
      Log log = Log(
        dateTime: DateTime.now(),
        state: LogState.updateData.stringDefinition,
        message: e.toString(),
      );

      addData(collectName: DocName.logs.stringDefinition, data: log.toMap());

      state = false;
    }
    return state;
  }
}
