import 'package:cloudbase_core_nullsafety/cloudbase_core_nullsafety.dart';
import 'package:cloudbase_database_nullsafety/src/document.dart';
import 'package:cloudbase_database_nullsafety/src/query.dart';
import 'package:cloudbase_database_nullsafety/src/response.dart';
import 'package:cloudbase_database_nullsafety/src/validater.dart';

class Collection extends Query {
  Collection(CloudBaseCore core, String collName)
      : super(core: core, coll: collName);

  String get name {
    return super.coll;
  }

  Document doc([docId]) {
    if (docId != null) {
      Validater.isDocId(docId);
    }

    return Document(core: super.core, coll: super.coll, docId: docId);
  }

  Future<DbCreateResponse> add(dynamic data) {
    Document doc = this.doc();
    return doc.create(data);
  }
}
