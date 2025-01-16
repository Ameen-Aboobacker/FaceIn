import 'dart:developer';
import 'dart:io';

import 'package:facein/application/capture_image_cubit/capture_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/colors.dart';
import 'employee_registration_consumer.dart';

class TakePhotoWidget extends StatelessWidget {
  const TakePhotoWidget({
    super.key,
    required this.onTake,
  });

  final VoidCallback onTake;

  @override
  Widget build(BuildContext context) {
    final image = context.watch<CaptureImageCubit>();
    log('error:${image.isError.toString()}');
    return Center(
      child: Column(
        children: [
          Stack(
            alignment: const Alignment(0.8, 0.9),
            children: [
              const ImageContainerWidget(),
              GestureDetector(
                onTap: onTake,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.photo_camera_rounded,
                      color: Colors.white,
                      size: 17,
                    ),
                  ),
                ),
              )
            ],
          ),
          /* BlocConsumer<CaptureImageCubit, CaptureImageState>(
            builder: (context, state) {
              return state.status ? Text('Pls Add image') : SizedBox();
            },
            listener: (context, state) {},
          )*/
          ValueListenableBuilder(
            valueListenable: imageFieldNotifier,
            builder: (context, value, child) {
              log('val:$value');
              return Center(
                child: Visibility(
                  visible: value,
                  child: Text(
                    'Photo is required',
                    style: TextStyle(fontSize: 13, color: Colors.red.shade800),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class ImageContainerWidget extends StatelessWidget {
  const ImageContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CaptureImageCubit, CaptureImageState>(
      listener: (context, state) {
        if (state is ImageCaptured) {
          imageFieldNotifier.value = false;
        }
      },
      builder: (context, state) {
        return Container(
          height: 165,
          width: 165,
          decoration: state is ImageCaptured
              ? BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primaryColor),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: FileImage(File(state.image.path)),
                  ),
                )
              : BoxDecoration(
                  color: const Color(0xFFD9D9E7),
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primaryColor),
                ),
          child: state is ImageCaptured
              ? null
              : const Center(child: Text('Add Photo *')),
        );
      },
    );
  }
}
