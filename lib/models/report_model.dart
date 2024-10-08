import 'package:cloud_firestore/cloud_firestore.dart';

class ReportModel {
  final String? reportReason;
  final String? imageUrl;
  final String? contactNumber;
  final String? location;
  final String? address;
  final String? contactEmail;
  final String? status;
  final String? id;

  ReportModel(
      {this.reportReason,
      this.imageUrl,
      this.contactNumber,
      this.location,
      this.address,
      this.contactEmail,
      this.status,
      this.id});

  static ReportModel fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return ReportModel(
      contactNumber: snapshot['contactNumber'],
      reportReason: snapshot['reportReason'],
      imageUrl: snapshot['imageUrl'],
      location: snapshot['location'],
      address: snapshot['address'],
      contactEmail: snapshot['contactEmail'],
      status: snapshot['status'],
      id: snapshot['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "contactNumber": contactNumber,
      "reportReason": reportReason,
      "imageUrl": imageUrl,
      "location": location,
      "address": address,
      "contactEmail": contactEmail,
      "status": status,
      "id": id,
    };
  }
}
