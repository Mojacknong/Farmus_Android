import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/model/farmclub_detail.dart';
import 'package:mojacknong_android/model/farmclub_mine_detail.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_init.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_picture.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_controller.dart';

import '../../../../model/farmclub_mine.dart';
import '../../farmclub_challenge_screen.dart';
import 'challenge_help.dart';
import 'challenge_step.dart';

class ChallengeFeed extends StatefulWidget {
  final FarmclubMineDetail farmclubInfo;
  final FarmclubMine farmclubMine;

  const ChallengeFeed({
    required this.farmclubInfo,
    required this.farmclubMine,
    super.key,
  });

  @override
  State<ChallengeFeed> createState() => _ChallengeFeedState();
}

class _ChallengeFeedState extends State<ChallengeFeed> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const FarmclubChallengeScreen(
                    detailId: '',
                  );
                },
              ),
            );
          },
          child: ChallengeStep(
            step: widget.farmclubInfo.stepNum,
            title: widget.farmclubInfo.stepName,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        ChallengeHelp(
          help: widget.farmclubInfo.stepTip,
          veggieInfoId: widget.farmclubInfo.veggieInfoId,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const FarmclubChallengeScreen(
                    detailId: "",
                  );
                },
              ),
            );
          },
        ),
        const SizedBox(
          height: 16,
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const FarmclubChallengeScreen(
                      detailId: "",
                    );
                  },
                ),
              );
            },
            child: widget.farmclubInfo.stepImages.isNotEmpty
                ? ChallengePicture(
                    registrationId:
                        widget.farmclubMine.registrationId.toString(),
                  )
                : ChallengeInit()),
      ],
    );
  }
}
