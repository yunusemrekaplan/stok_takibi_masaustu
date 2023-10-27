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

  //final LogDbController _logDbController = LogDbController();

  Future<Document?> addData({
    required String docName,
    required Map<String, dynamic> data,
  }) async {
    try {
      return await _db.collection(docName).add(data);
    } on Exception catch (e) {
      Log log = Log(
        dateTime: DateTime.now(),
        state: LogState.addData.stringDefinition,
        message: e.toString(),
      );

      addData(docName: DocName.logs.stringDefinition, data: log.toMap());
    }

    return null;
  }

  Future<Page<Document>> getData({required String docName}) async {
    final CollectionReference ref = _db.collection(docName);
    return await ref.get();
  }

  // Future<void> setData({String path, Map<String, dynamic> data}) async {
  //   final DocumentReference ref = _db.doc(path);
  //   await ref.set(data);
  // }
  //
  // Future<void> updateData({String path, Map<String, dynamic> data}) async {
  //   final DocumentReference ref = _db.doc(path);
  //   await ref.update(data);
  // }
  //
  // Future<void> deleteData({String path}) async {
  //   final DocumentReference ref = _db.doc(path);
  //   await ref.delete();
  // }
  //
  //
  // Future<QuerySnapshot> getListData({String path}) async {
  //   final DocumentReference ref = _db.doc(path);
  //   return await ref.collection(path).get();
  // }
  //
  // Stream<QuerySnapshot> streamData({String path}) {
  //   final DocumentReference ref = _db.doc(path);
  //   return ref.collection(path).snapshots();
  // }
  //
}
