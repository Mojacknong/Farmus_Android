import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/community/component/community_picture.dart';
import 'package:mojacknong_android/view/farmclub/component/record/record_picture.dart';
import 'package:mojacknong_android/view/farmclub/component/record/record_profile.dart';

import '../../../model/farmclub_mission.dart';

class MissionFeed extends StatefulWidget {
  final FarmclubMission mission;

  const MissionFeed({
    super.key,
    required this.mission,
  });

  @override
  State<MissionFeed> createState() => _MissionFeedState();
}

class _MissionFeedState extends State<MissionFeed> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        RecordProfile(
          profile: widget.mission.profileImage ?? "",
          nickname: widget.mission.nickName,
          postTime: widget.mission.date,
        ),
        SizedBox(
          height: 8,
        ),
        CommunityPicture(
          image: widget.mission.image,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.mission.content ?? '', // null이면 빈 문자열 또는 다른 기본값으로 변경
              style: FarmusThemeData.darkStyle14,
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ],
    );
  }
}
