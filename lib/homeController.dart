import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  var cropImagePath = ''.obs;
  var cropImageSize = ''.obs;

  var compressImagePath = ''.obs;
  var compressImageSize = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";
      // final cropImageFile = await ImageCropper().cropImage(
      //     sourcePath: selectedImagePath.value,
      //     maxHeight: 512,
      //     maxWidth: 512,
      //     compressFormat: ImageCompressFormat.jpg);
      // cropImagePath.value = cropImageFile!.path;
      // cropImageSize.value =
      //     ((File(cropImagePath.value)).lengthSync() / 1024 / 1024)
      //             .toStringAsFixed(2) +
      //         "Mb";

      // final dir = await Directory.systemTemp;
      // final targetPath = dir.absolute.path + "/temp.jpg";
      // var compressedFile = await FlutterImageCompress.compressAndGetFile(
      //     cropImagePath.value, targetPath,
      //     quality: 90);
      // compressImagePath.value = compressedFile!.path;
      // compressImageSize.value =
      //     ((File(compressImagePath.value)).lengthSync() / 1024 / 1024)
      //             .toStringAsFixed(2) +
      //         "Mb";

      // uploadImage(compressedFile);
    } else {
      Get.snackbar('Error', 'No image Selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}
