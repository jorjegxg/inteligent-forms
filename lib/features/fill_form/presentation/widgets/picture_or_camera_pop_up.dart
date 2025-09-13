//show picture or camera pop up

import 'package:flutter/material.dart';
import 'package:inteligent_forms/core/constants/string_constants.dart';
import 'package:sizer/sizer.dart';

Future<void> showPictureOrCameraPopUp(
  BuildContext context, {
  required Function() onCameraPressed,
  required Function() onPhotoGalleryPressed,
}) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext dialogContext) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                AppStringConstants.chosePictureOrCamera,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 3.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          onCameraPressed();

                          Navigator.of(dialogContext).pop();
                        },
                        child: const Text(AppStringConstants.camera),
                      ),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          onPhotoGalleryPressed();

                          Navigator.of(dialogContext).pop();
                        },
                        child: const Text(
                          AppStringConstants.photoGallery,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
