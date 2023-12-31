import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/model/community_posting.dart';
import 'package:mojacknong_android/repository/community_repository.dart';
import 'package:mojacknong_android/view/community/component/my_post_feed.dart';

class MyPostScreen extends StatefulWidget {
  const MyPostScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MyPostScreen> createState() => _MyPostScreenState();
}

class _MyPostScreenState extends State<MyPostScreen> {
  List<CommunityPosting> myPostings = [];

  @override
  void initState() {
    super.initState();
    getMyPosting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: "내 글",
      ),
      backgroundColor: FarmusThemeData.white,
      body: SingleChildScrollView(
        child: Column(
          children: myPostings.map((posting) {
            return MyPostFeed(
              postingId: posting.postingId,
              userId: posting.userId,
              postTime: posting.createdAt,
              comment: posting.commentCount.toString(),
              postCategory: posting.tag,
              title: posting.title,
              content: posting.contents,
              image: posting.postingImage.isNotEmpty
                  ? posting.postingImage[0]
                  : "",
            );
          }).toList(),
        ),
      ),
    );
  }

  Future<void> getMyPosting() async {
    try {
      List<CommunityPosting> postings =
          await CommunityRepository.getMyPosting();
      setState(() {
        myPostings = postings;
      });
    } catch (e) {
      print("게시글 가져오기 실패: $e");
      // 에러 처리 또는 사용자에게 알림 등 추가
    }
  }
}
