import 'dart:collection';

import 'package:carist/model/data.dart';
import 'package:carist/model/logos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreClient {
  CollectionReference brands = FirebaseFirestore.instance.collection('brands');
  WriteBatch batch = FirebaseFirestore.instance.batch();

  Future<Extra> brandData(String hebBrandName) async {
    final query = await brands.where('heb', isEqualTo: hebBrandName).limit(1).get();
    if (query.docs.isEmpty) {
      return Extra(brandEng: '', countryEng: '', logoUrl: '');
    }
    final data = query.docs.first.data() as Map<String, dynamic>;
    return Extra(
      brandEng: data['eng'] ?? '',
      countryEng: '',
      logoUrl: data['logo'] ?? '',
    );
  }

  Future<void> updateLogos(Map<String, Logos> logos) {
    Map<String, String> map = HashMap();
    logos.forEach((key, value) {
      map[value.name] = value.logotype.uri;
    });
    return brands.get().then((querySnapshot) {
      querySnapshot.docs.forEach((document) {
        String brand = (document.data() as Map<String, dynamic>)['eng'] as String;
        String? url = map[brand];
        batch.update(document.reference, {'logo': '$url'});
      });

      return batch.commit();
    });
  }
}
