import 'dart:io';

import 'package:civic_24/models/report_model.dart';
import 'package:civic_24/ui/common/app_colors.dart';
import 'package:civic_24/ui/common/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showToast(
            message: 'The email address is already in use.',
            color: AppColors.kcFail);
      } else {
        showToast(
            message: 'An error occurred: ${e.code}', color: AppColors.kcFail);
      }
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        showToast(
            message: 'Invalid email or password.', color: AppColors.kcFail);
      } else {
        showToast(
            message: 'An error occurred: ${e.code}', color: AppColors.kcFail);
      }
    }
    return null;
  }

  void signOut(String email, String password) async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      showToast(
          message: 'An error occurred: ${e.code}', color: AppColors.kcFail);
    }
    return null;
  }

  Future<String> uploadImage(
      {required String fileName, required File imageFile}) async {
    try {
      final storageRef = _firebaseStorage.ref().child('uploads/$fileName');
      await storageRef.putFile(imageFile);
      final url = await storageRef.getDownloadURL();
      return url;
    } on FirebaseException {
      showToast(
          message: 'An unexpected error occured... Kindly try again',
          color: AppColors.kcFail);
    }
    return "";
  }

  Stream<List<ReportModel>> getUserReports() {
    final reportCollection = _firebaseFirestore.collection("reports");

    return reportCollection
        .snapshots()
        .map((qureySnapshot) => qureySnapshot.docs
            .map(
              (e) => ReportModel.fromSnapshot(e),
            )
            .toList());
  }

  void createReport(ReportModel reportModel) {
    try {
      final reportCollection = _firebaseFirestore.collection("reports");

      String id = reportCollection.doc().id;

      final newReport = ReportModel(
        reportReason: reportModel.reportReason,
        imageUrl: reportModel.imageUrl,
        contactNumber: reportModel.contactNumber,
        location: reportModel.location,
        address: reportModel.address,
        status: reportModel.status,
        contactEmail: reportModel.contactEmail,
        id: id,
      ).toJson();

      reportCollection.doc(id).set(newReport);
    } on FirebaseException {
      showToast(
          message: 'An unexpected error occured... Kindly try again',
          color: AppColors.kcFail);
    }
  }
}
