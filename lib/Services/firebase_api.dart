import 'package:cloud_firestore/cloud_firestore.dart';

class Api {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String path;
  CollectionReference reference;

  Api({this.path}) {
    reference = _db.collection(path);
  }

  Future<QuerySnapshot> getDataCollection() {
    return reference.get();
  }

  Stream<QuerySnapshot> streamDataCollection() {
    return reference.snapshots() ;
  }
  Stream<QuerySnapshot> mapData(String userId) {
    return reference.doc(userId).collection("presets").snapshots();
  }

  Future<DocumentSnapshot> getDocumentById(String id) {
    return reference.doc(id).get();
  }

  Future<void> removeDocument(String id){
    return reference.doc(id).delete();
  }

  Future<DocumentReference> addDocument(Map data) {
    return reference.add(data);
  }

  Future<void> addDocumentWithId(String id, Map data) {
    return reference.doc(id).set(data);
  }

  Future<void> updatedoc(Map data , String id) {
    return reference.doc(id).set(data) ;
  }
}