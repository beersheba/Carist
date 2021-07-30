import 'dart:collection';

import 'package:carist/model/data.dart';
import 'package:carist/model/logos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreClient {
  CollectionReference brands = FirebaseFirestore.instance.collection('brands');
  WriteBatch batch = FirebaseFirestore.instance.batch();

  Future<Extra> brandData(String hebBrandName) async {
    Extra extra = Extra();
    await brands.where('heb', isEqualTo: hebBrandName).get().then((value) {
      if (value.docs.isNotEmpty) {
        Map<String, dynamic> documentData = value.docs.single.data();
        extra.brandEng = documentData['eng'];
        extra.logoUrl = documentData['logo'];
      }
    });
    return extra;
  }

  Future<void> updateLogos(Map<String, Logos> logos) {
    Map<String, String> map = HashMap();
    logos.forEach((key, value) {
      map[value.name] = value.logotype.uri;
    });
    return brands.get().then((querySnapshot) {
      querySnapshot.docs.forEach((document) {
        String brand = document.data();
        String url = map['$brand'];
        batch.update(document.reference, {'logo': '$url'});
      });

      return batch.commit();
    });
  }
}
