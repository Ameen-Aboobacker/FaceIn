part of 'capture_image_cubit.dart';

@immutable
sealed class CaptureImageState {}

final class CaptureImageInitial extends CaptureImageState {}

final class ImageCapturing extends CaptureImageState {}

final class ImageCaptured extends CaptureImageState {
  final XFile image;

  ImageCaptured(this.image);
}
