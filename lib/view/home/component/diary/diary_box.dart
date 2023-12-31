import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class DiaryBox extends StatelessWidget {
  final String? nickname;
  final Widget imageWidget; //API 연결하면 주소로 바꾸기
  final int? age;

  const DiaryBox({
    Key? key,
    required this.nickname,
    required this.imageWidget,
    required this.age,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? nicknameLength = nickname!.length.toDouble();
    double? ageLength = age!.toString().length.toDouble();

    double? boxSize = utf8.encode(nickname!).length.toDouble() +
        utf8.encode(age!.toString()).length.toDouble();

    print(nicknameLength);
    print(ageLength);
    print(boxSize * MediaQuery.of(context).devicePixelRatio);
    return Container(
      alignment: Alignment.topCenter,
      width: double.infinity,
      height: 244,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            child: SvgPicture.asset(
              'assets/image/green_rec.svg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 60,
            child: imageWidget,
          ),
          Positioned.fill(
            top: 142,
            bottom: 0,
            child: SvgPicture.asset('assets/image/light_wave.svg',
                width: double.infinity, fit: BoxFit.fitWidth),
          ),
          Positioned.fill(
            top: 142,
            bottom: 0,
            child: SvgPicture.asset('assets/image/dark_wave.svg',
                width: double.infinity, fit: BoxFit.fitWidth),
          ),
          Positioned(
              top: 16,
              left: 16,
              child: Container(
                child: SizedBox(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xffE8FAD0),
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '$nickname ',
                            style: const TextStyle(
                              color: FarmusThemeData.primary,
                              fontSize: 15,
                            ),
                          ),
                          TextSpan(
                            text: 'D+$age',
                            style: const TextStyle(
                              color: FarmusThemeData.primary,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
