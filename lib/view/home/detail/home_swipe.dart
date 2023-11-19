import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/home/component/home_green_box_user.dart';

class SwipeScreen extends StatefulWidget {
  const SwipeScreen({Key? key}) : super(key: key);

  @override
  _SwipeScreenState createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
  final PageController _pageController = PageController();
  final List<String> _pageContents = ['Page 1', 'Page 2', 'Page 3'];
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FarmusThemeData.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _pageContents.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const DiaryScreen(),
                    //   ),
                    // );
                  },
                  child: buildPageWidget(index),
                );
              },
            ),
          ),
          buildPageIndicator(),
        ],
      ),
    );
  }

  Widget buildPageWidget(int index) {
    if (index == 0) {
      return const HomeGreenBoxUser();
    } else if (index == 1) {
      return const HomeGreenBoxUser();
    } else if (index == 2) {
      return const HomeGreenBoxUser();
    } else {
      return Container();
    }
  }

  Widget buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _pageContents.length,
        (index) => buildIndicator(index),
      ),
    );
  }

  Widget buildIndicator(int index) {
    return Container(
      width: 6.0,
      height: 6.0,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? FarmusThemeData.dark : Colors.grey,
      ),
    );
  }
}