import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/farmclub/component/button_brown.dart';
import 'package:mojacknong_android/view/farmclub/component/button_white.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_help.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_init.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_picture.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_step.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub_title_with_divider.dart';
import 'package:mojacknong_android/view/farmclub/farmclub_auth_screen.dart';
import 'package:mojacknong_android/view/farmclub/my_farmclub_mission_screen.dart';
import 'package:mojacknong_android/view_model/controllers/crop/crop_info_step_controller.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_auth_controller.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_controller.dart';

import 'farmclub_help_screen.dart';
import 'farmclub_mission_feed_screen.dart';

class FarmclubChallengeScreen extends StatefulWidget {
  final String? detailId;

  const FarmclubChallengeScreen({Key? key, required this.detailId})
      : super(key: key);

  @override
  State<FarmclubChallengeScreen> createState() =>
      _FarmclubChallengeScreenState();
}

class _FarmclubChallengeScreenState extends State<FarmclubChallengeScreen> {
  FarmclubController _farmclubController = Get.find();
  FarmclubAuthController _authController = Get.find();
  CropInfoStepController _cropInfoStepController =
      Get.put(CropInfoStepController());

  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    _cropInfoStepController.veggieInfoId.value =
        _farmclubController.farmclubInfo.value!.veggieInfoId.toString();
    _cropInfoStepController.stepNum.value =
        _farmclubController.farmclubInfo.value!.stepNum.toInt();
    await _cropInfoStepController.getCropInfoStep();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: "함께 도전해요"),
      backgroundColor: FarmusThemeData.white,
      body: Obx(() {
        if (_cropInfoStepController.cropInfoStep.isEmpty) {
          return Center(child: CircularProgressIndicator(color: FarmusThemeData.brown));
        } else {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FarmclubTitleWithDivider(title: "완료한 Step"),
                _cropInfoStepController.cropInfoStepClear.length == 0
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "아직 완료한 Step이 없어요",
                          style: FarmusThemeData.darkStyle14,
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            _cropInfoStepController.cropInfoStepClear.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ChallengeStep(
                                step: index,
                                title: _cropInfoStepController
                                    .cropInfoStepClear[index].stepName,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              const Divider(
                                endIndent: 16,
                                indent: 16,
                                color: FarmusThemeData.grey4,
                              ),
                            ],
                          );
                        },
                      ),
                const SizedBox(
                  height: 16,
                ),
                const FarmclubTitleWithDivider(title: "현재 Step"),
                ChallengeStep(
                  step: _cropInfoStepController.stepNum.toInt(),
                  title:
                      _cropInfoStepController.cropInfoStepCurrent[0].stepName,
                ),
                const SizedBox(
                  height: 16,
                ),
                ChallengeHelp(
                  help: _cropInfoStepController.cropInfoStepCurrent[0].tip,
                  veggieInfoId: _cropInfoStepController.veggieInfoId.toString(),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return FarmclubHelpScreen(
                            veggieInfoId:
                                _cropInfoStepController.veggieInfoId.toString(),
                          );
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                _farmclubController.farmclubInfo.value!.stepImages.isNotEmpty
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return FarmclubMissionFeedScreen(
                                  registrationId: _farmclubController
                                      .myFarmclubState[_farmclubController
                                          .selectedFarmclubIndex
                                          .toInt()]
                                      .registrationId
                                      .toString(),
                                  challengeId: _farmclubController
                                      .myFarmclubState[_farmclubController
                                          .selectedFarmclubIndex
                                          .toInt()]
                                      .challengeId
                                      .toInt(),
                                  stepNum: _farmclubController
                                      .farmclubInfo.value!.stepNum
                                      .toInt(),
                                );
                              },
                            ),
                          );
                        },
                        child: ChallengePicture())
                    : Center(
                        child: ChallengeInit(),
                      ),
                const SizedBox(
                  height: 16,
                ),
                const FarmclubTitleWithDivider(title: "다음 Step"),
                _cropInfoStepController.cropInfoStepTodo.length == 0
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "현재 Step이 마지막 Step이에요",
                          style: FarmusThemeData.darkStyle14,
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            _cropInfoStepController.cropInfoStepTodo.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ChallengeStep(
                                step: index +
                                    _cropInfoStepController.stepNum.toInt() +
                                    1,
                                title: _cropInfoStepController
                                    .cropInfoStepTodo[index].stepName,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              const Divider(
                                endIndent: 16,
                                indent: 16,
                                color: FarmusThemeData.grey4,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                            ],
                          );
                        },
                      ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          );
        }
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: ButtonWhite(
                  text: "내 미션",
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MyFarmclubMissionScreen(
                            challengeID: 4,
                          );
                        },
                      ),
                    );
                  }),
            ),
            Expanded(
              flex: 2,
              child: ButtonBrown(
                text: "미션 인증하기",
                enabled: RxBool(true),
                onPress: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FarmclubAuthScreen(
                        farmclubData: _farmclubController.myFarmclubState,
                      ),
                    ),
                  );
                  // 업로드 성공 후 새로고침
                  if (_authController.missionUploaded.value) {
                    _authController.missionUploaded.value = false; // 초기화
                    loadFarmclubData(); // FarmclubScreen 새로고침
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loadFarmclubData() async {
    await _farmclubController.getMyFarmclub();
    setState(() {});
  }
}
