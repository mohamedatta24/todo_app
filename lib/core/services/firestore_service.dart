import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/core/errors/custom_exception.dart';
import 'package:todo_app/core/services/database_service.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    try {
      if (documentId != null) {
        await firestore.collection(path).doc(documentId).set(data);
      } else {
        await firestore.collection(path).add(data);
      }
    } on FirebaseException catch (e) {
      log('Firestore Error: ${e.code} - ${e.message}');
      throw CustomException(e.message ?? 'Firestore error occurred');
    } catch (e) {
      log('Unexpected Firestore Error: $e');
      throw CustomException('Unexpected error occurred');
    }
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String documentId,
  }) async {
    final doc = await firestore.collection(path).doc(documentId).get();
    return doc.data() as Map<String, dynamic>;
  }
}
