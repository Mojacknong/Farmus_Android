import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeFinalController extends GetxController {
  // 텍스트 입력 필드 컨트롤러
  final TextEditingController controller = TextEditingController();
  RxBool hasInput = RxBool(false);
  RxBool hasSpecialCharacters = RxBool(false);
  RxBool selected = RxBool(false);

  // 선택 박스 컨트롤러
  final isTaped1 = RxBool(false);
  final isTaped2 = RxBool(false);
  final isTaped3 = RxBool(false);
  final isTaped4 = RxBool(false);
  final isTaped5 = RxBool(false);
  final isTaped6 = RxBool(false);

  final isSecond = RxBool(false);

  RxBool hasBoxesSelected = RxBool(false);

  var time = RxInt(0);
  var skill = RxString("");

  final image = Rxn<File>();

  @override
  void onInit() {
    super.onInit();
    controller.addListener(() {
      if (isTaped1.value || isTaped2.value) {
        hasBoxesSelected.value = true;
      } else {
        hasBoxesSelected.value = false;
      }
    });
  }

  void setImageFile(File file) {
    image.value = file;
  }

  void pickBox1() {
    isTaped1.value = true;
    isTaped2.value = false;
    time.value = 0;
  }

  void pickBox2() {
    isTaped1.value = false;
    isTaped2.value = true;
    time.value = 1;
  }

  void pickBox3() {
    isTaped3.value = true;
    isTaped4.value = false;
    time.value = 2;
  }

  void pickBox4() {
    isTaped3.value = false;
    isTaped4.value = true;
    time.value = 3;
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
