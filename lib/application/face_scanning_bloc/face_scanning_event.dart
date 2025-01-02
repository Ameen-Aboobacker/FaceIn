part of 'face_scanning_bloc.dart';

@immutable
sealed class FaceScanningEvent {}

final class ScanningFace extends FaceScanningEvent {
  //final XFile image;
  ScanningFace();
}
final class SampleScan extends FaceScanningEvent{}
