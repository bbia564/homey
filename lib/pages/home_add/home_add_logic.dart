import 'dart:typed_data';

import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:home_restoratives/db_restorative/db_home.dart';
import 'package:image_picker/image_picker.dart';

import '../../db_restorative/home_entity.dart';

class HomeAddLogic extends GetxController {
  DBHome dbHome = Get.find<DBHome>();

  Uint8List? image;
  String name = '';
  var type = 0.obs;
  DateTime finishTime = DateTime.now().add(const Duration(days: 7));

  void imageSelected() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final imageBytes = await pickedFile.readAsBytes();
        image = imageBytes;
        update();
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Please check album permissions or select a new image');
      return;
    }
  }

  void showBottomPicker(BuildContext context) {
    BottomPicker(
      pickerTitle: const Text(''),
      displaySubmitButton: false,
      items: const [
        Text(
          'Children',
          textAlign: TextAlign.center,
        ),
        Text('Adult', textAlign: TextAlign.center)
      ],
      onChange: (index) {
        type.value = index;
      },
    ).show(context);
  }

  void addData() async {
    if (image == null) {
      Fluttertoast.showToast(msg: 'Please select image.');
      return;
    }
    if (name.isEmpty) {
      Fluttertoast.showToast(msg: 'Please input name.');
      return;
    }
    await dbHome.insertHome(HomeEntity(
      id: 0,
      createdTime: DateTime.now(),
      type: type.value,
      image: image!,
      name: name,
      finishTime: finishTime,
      hadWarn: 0,
    ));
    Fluttertoast.showToast(msg: 'Add success');
    Get.back();
  }
}
