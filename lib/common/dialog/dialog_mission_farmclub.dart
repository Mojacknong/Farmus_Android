import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class DialogMissionStepFarmclub extends StatefulWidget {
  final String image;
  final String title;
  final String step;

  const DialogMissionStepFarmclub(
      {super.key,
      required this.image,
      required this.title,
      required this.step});

  @override
  State<DialogMissionStepFarmclub> createState() => _DialogMissionStepFarmclubState();
}

class _DialogMissionStepFarmclubState extends State<DialogMissionStepFarmclub> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: AlertDialog(
        backgroundColor: FarmusThemeData.white,
        actions: <Widget>[
          Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      height: 30,
                    ),
                  ),
                  widget.image != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            widget.image,
                            width: 100,
                            height: 100,
                          ),
                        )
                      : SvgPicture.asset(
                          "assets/image/ic_lettuce_blue.svg",
                        ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.title,
                    style: FarmusThemeData.grey1Style14,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/image/ic_join_check.svg",
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Step ${widget.step}을 완료했어요",
                        style: FarmusThemeData.darkStyle16,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
