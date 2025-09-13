import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inteligent_forms/core/constants/string_constants.dart';
import 'package:inteligent_forms/core/errors/exceptions.dart';
import 'package:inteligent_forms/features/fill_form/data/models/submision_model.dart';

class SubmissionApi {
  final FirebaseFirestore firestore;

  SubmissionApi({required this.firestore});

  Future<void> submitSubmission(SubmisionModel submission) async {
    try {
      await firestore.collection('submissions').add(submission.toJson());
    } on FirebaseException {
      throw MediumException(
          runtimeType, AppStringFailuresMessages.unexpectedFailure);
    }
  }

  Future<List<SubmisionModel>> getSubmissions(String formId) async {
    try {
      final snapshot = await firestore
          .collection('submissions')
          .where('formId', isEqualTo: formId)
          .orderBy('dateWhenSubmitted', descending: true)
          .get();
      return snapshot.docs
          .map((doc) => SubmisionModel.fromJson(doc.data()))
          .toList();
    } on FirebaseException {
      throw MediumException(
          runtimeType, AppStringFailuresMessages.unexpectedFailure);
    }
  }

  Future<void> deleteSubmission(String id) async {
    try {
      await firestore.collection('submissions').doc(id).delete();
    } on FirebaseException {
      throw MediumException(
          runtimeType, AppStringFailuresMessages.unexpectedFailure);
    }
  }

  Future<void> updateSubmission(SubmisionModel submission) async {
    try {
      await firestore
          .collection('submissions')
          .doc(submission.id)
          .update(submission.toJson());
    } on FirebaseException {
      throw MediumException(
          runtimeType, AppStringFailuresMessages.unexpectedFailure);
    }
  }
}
