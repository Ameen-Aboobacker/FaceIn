import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.rekognition(String message) = RekognitionFailure;
  const factory Failure.firestore(String message) = FirestoreFailure;
  const factory Failure.firebaseAuth(String message) = FirebaseAuthFailure;
  const factory Failure.network(String message) = NetworkFailure;
  const factory Failure.unexpected(String message) = UnexpectedFailure;
}