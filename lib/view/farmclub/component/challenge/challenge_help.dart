import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/farmclub_help_screen.dart';

class ChallengeHelp extends StatelessWidget {
  final String help;
  final String veggieInfoId;
  Function() onTap;

  ChallengeHelp({
    super.key,
    required this.help,
    required this.veggieInfoId,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.centerLeft,
          width: double.infinity,
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: FarmusThemeData.brown3),
          child: Row(
            children: [
              SizedBox(
                width: 16,
              ),
              Text(
                "도움말   $help",
                textAlign: TextAlign.start,
                style: FarmusThemeData.brownText13,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
