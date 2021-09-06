
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class CrudMethods {
  Future<void> addData(blogData) async {
    Firestore.instance.collection("location").add(blogData).catchError((e) {
      print(e);
    });
  }

  Future<void> addDataCommunity(DataCommunity) async {
    Firestore.instance.collection("feedback").add(DataCommunity).catchError((e) {
      print(e);
    });
  }

  Future<void> addDataHelper(DataHelper) async {
    Firestore.instance.collection("inginBantu").add(DataHelper).catchError((e) {
      print(e);
    });
  }

  getData() async {
    return await Firestore.instance.collection("location").snapshots();
  }

    getDataCommunity() async {
    return await Firestore.instance.collection("feedback").snapshots();
  }

      getDataHelper() async {
    return await Firestore.instance.collection("inginBantu").snapshots();
  }


 Future<void> deleteData(String docId) async{
    Firestore.instance.collection("location").document(docId).delete().catchError((e){
      print(e);
    });
  }
}

