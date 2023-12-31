import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub_text_info.dart';
import 'package:mojacknong_android/view/farmclub/farmclub_detail_screen.dart';

class RecommendFarmclub extends StatefulWidget {
  final int id;
  final String farmclubImage;
  final String vegetable;
  final String farmclubTitle;
  final String level;
  final int nowPerson;
  final int maxPerson;

  RecommendFarmclub({
    Key? key,
    required this.id,
    required this.vegetable,
    required this.farmclubImage,
    required this.farmclubTitle,
    required this.level,
    required this.nowPerson,
    required this.maxPerson,
  }) : super(key: key);

  @override
  State<RecommendFarmclub> createState() => _RecommendFarmclubState();
}

class _RecommendFarmclubState extends State<RecommendFarmclub> {
  @override
  Widget build(BuildContext context) {
    return Bouncing(
      onPress: () {},
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FarmclubDetailScreen(
                  id: widget.id,
                  title: widget.farmclubTitle,
                );
              },
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: 156,
                    height: 156,
                    decoration: BoxDecoration(
                      color: FarmusThemeData.background,
                      borderRadius: BorderRadius.circular(8.65),
                    ),
                    child: Image.network(
                      widget.farmclubImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: FarmusThemeData.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      child: Text(
                        widget.vegetable,
                        style: TextStyle(
                          color: FarmusThemeData.dark,
                          fontSize: 13,
                          fontFamily: "Pretendard",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              FarmclubTextInfo(
                vegetable: widget.vegetable,
                farmclubTitle: widget.farmclubTitle,
                level: widget.level,
                nowPerson: widget.nowPerson,
                maxPerson: widget.maxPerson,
                isRecommend: true,
                status: "",
              )
            ],
          ),
        ),
      ),
    );
  }
}
