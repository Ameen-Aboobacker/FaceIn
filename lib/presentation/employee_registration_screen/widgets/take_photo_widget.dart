import 'dart:io';

import 'package:flutter/material.dart';

import '../../../core/colors.dart';

class TakePhotoWidget extends StatelessWidget {
  const TakePhotoWidget({
    super.key,
    required this.image,
    required this.onTake,
    required this.onRetake,
  });

  final File? image;
  final VoidCallback onTake;

  final VoidCallback onRetake;

  @override
  Widget build(BuildContext context) {
    const SizedBox kHeightform3 = SizedBox(height: 6);
    return Column(
      children: [
        image == null
            ? InkWell(
                onTap: onTake,
                child: const ImageContainerWidget(
                  child: Center(
                    child: Text(
                      'Take Photo',
                      style: TextStyle(
                        fontSize: 17,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              )
            : ImageContainerWidget(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.primaryColor, width: 1),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: FileImage(image!),
                  ),
                ),
              ),
        kHeightform3,
        image == null
            ? const SizedBox(height: 10)
            : InkWell(
                onTap: onRetake,
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.primaryColor,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: const Text(
                    'Retake',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.primaryColor
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}

class ImageContainerWidget extends StatelessWidget {
  const ImageContainerWidget({
    this.decoration = const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      border: Border.symmetric(
          vertical: BorderSide(color: AppColors.primaryColor, width: 1),
          horizontal: BorderSide(color: AppColors.primaryColor, width: 1)),
    ),
    super.key,
    this.child,
  });
  final BoxDecoration decoration;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 125, width: 125, decoration: decoration, child: child);
  }
}
