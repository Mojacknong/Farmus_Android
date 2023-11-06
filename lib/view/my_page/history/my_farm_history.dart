import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/custom_app_bar.dart';

class MyFarmHistory extends StatelessWidget {
  const MyFarmHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: const Center(
        child: Text("팜 히스토리"),
      ),
    );
  }
}