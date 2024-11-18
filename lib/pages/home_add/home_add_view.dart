import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:home_restoratives/pages/home_add/home_text_field.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../main.dart';
import 'home_add_logic.dart';

class HomeAddPage extends GetView<HomeAddLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Add",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: primaryColor,
          foregroundColor: Colors.white),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<HomeAddLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: <Widget>[
                  Align(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                              width: 141,
                              height: 111,
                              color: Colors.grey[200],
                              child: controller.image == null
                                  ? const Icon(
                                      Icons.photo,
                                      size: 40,
                                      color: Colors.grey,
                                    )
                                  : Image.memory(
                                      controller.image!,
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ))
                          .gestures(onTap: () {
                        controller.imageSelected();
                      }),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Drug name',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 44,
                    child: HomeTextField(
                        value: controller.name,
                        hintText: 'Enter drug name',
                        maxLength: 20,
                        onChange: (value) {
                          controller.name = value;
                        }),
                  ).decorated(
                      border: Border.all(
                        color: Colors.grey[300]!,
                      ),
                      borderRadius: BorderRadius.circular(8)),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: <Widget>[
                      const Text(
                        'Type',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      <Widget>[
                        Obx(() {
                          return Text(controller.type.value == 0
                              ? 'Children'
                              : 'Adult');
                        }),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.keyboard_arrow_right,
                          size: 20,
                          color: Colors.black,
                        )
                      ].toRow(mainAxisAlignment: MainAxisAlignment.end)
                    ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
                  )
                      .decorated(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(8))
                      .gestures(onTap: () {
                    controller.showBottomPicker(context);
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Shelf life',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  DateTimePickerWidget(
                    minDateTime: DateTime.now().add(const Duration(seconds: 1)),
                    initDateTime: controller.finishTime,
                    dateFormat: 'yyyy-MM-dd',
                    pickerTheme: const DateTimePickerTheme(
                        showTitle: false,
                        backgroundColor: Colors.white,
                        cancel: null,
                        confirm: null),
                    onChange: (dateTime, selectedIndex) {
                      controller.finishTime = dateTime;
                    },
                  ),
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: const Text(
                      'Add',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                      .decorated(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(8))
                      .marginOnly(top: 20)
                      .gestures(onTap: () {
                    controller.addData();
                  })
                ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
              ).decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(12))
            ].toColumn(),
          );
        }).marginAll(15)),
      ),
    );
  }
}
