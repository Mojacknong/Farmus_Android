import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/custom_app_bar.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/community/component/bottom_comment.dart';
import 'package:mojacknong_android/view/community/component/community_comment.dart';
import 'package:mojacknong_android/view/community/component/community_content.dart';
import 'package:mojacknong_android/view/community/component/community_picture.dart';
import 'package:mojacknong_android/view/community/component/detail_post_profile.dart';
import 'package:mojacknong_android/view/community/component/post_category.dart';

class DetailPostScreen extends StatefulWidget {
  @override
  _DetailPostScreenState createState() => _DetailPostScreenState();
}

class _DetailPostScreenState extends State<DetailPostScreen> {
  final List<Widget> comments = [];

  _DetailPostScreenState() {
    comments.addAll([
      CommunityComment(),
      CommunityComment(),
      CommunityComment(),
      CommunityComment(),
      CommunityComment(),
      CommunityComment(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 100),
          child: Column(
            children: [
              Row(
                children: [
                  DetailPostProfile(),
                  const Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: PostCategory(
                        category: "도와주세요",
                      ),
                    ),
                  ),
                ],
              ),
              CommunityContent(
                content: "방울토마토가 자라지 않습니다..\n왜 안자라는 걸까요? 봐주실 분 구합니다.",
              ),
              CommunityPicture(
                image: "assets/image/image_example_community.png",
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "댓글",
                    style: TextStyle(
                      color: FarmusThemeData.dark,
                      fontSize: 16,
                      fontFamily: "Pretendard",
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    comments.length.toString(),
                    style: const TextStyle(
                      color: FarmusThemeData.dark,
                      fontSize: 16,
                      fontFamily: "Pretendard",
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              ...comments,
            ],
          ),
        ),
      ),
      bottomSheet: BottomComment(),
    );
  }
}
