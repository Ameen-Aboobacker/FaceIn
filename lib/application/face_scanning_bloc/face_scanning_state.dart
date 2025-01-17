part of 'face_scanning_bloc.dart';

@immutable
sealed class FaceScanningState {}

final class ScanningInitial extends FaceScanningState {}

final class Scanning extends FaceScanningState {}

final class ScanningSuccess extends FaceScanningState {
  final VerifyModel verifyModel;
  ScanningSuccess(this.verifyModel);
}

final class ScanningFailed extends FaceScanningState {
  final Failure failure;
  ScanningFailed({required this.failure});
}
