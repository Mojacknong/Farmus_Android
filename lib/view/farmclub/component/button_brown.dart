import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_button.dart';

class ButtonBrown extends StatelessWidget {
  final String text;
  final RxBool enabled;
  final Function()? onPress;

  const ButtonBrown({
    Key? key,
    required this.text,
    required this.enabled,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.all(0.0),
        child: PrimaryButton(
          text: text,
          backgroundColor: enabled.value
              ? FarmusThemeData.brownButton
              : FarmusThemeData.grey3,
          foregroundColor:
              enabled.value ? FarmusThemeData.white : FarmusThemeData.white,
          onPressed: enabled.value ? onPress : null,
        ),
      );
    });
  }
}
