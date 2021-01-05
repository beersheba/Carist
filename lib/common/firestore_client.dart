import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreClient {
  CollectionReference brands = FirebaseFirestore.instance.collection('brands');

  Future<String> engBrandName(String hebBrandName) async {
    String name = "";
    await brands.where('heb', isEqualTo: hebBrandName).get().then((value) {
      if (value.docs.isNotEmpty) {
        Map<String, dynamic> documentData = value.docs.single.data();
        name = documentData['eng'];
      }
    });
    return name;
  }
}
