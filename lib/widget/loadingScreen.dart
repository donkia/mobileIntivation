import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(), // 로딩 애니메이션
            SizedBox(height: 20), // 간격
            Text('초대장을 준비 중입니다. 방문해주셔서 감사드립니다!'), // 로딩 텍스트
          ],
        ),
      ),
    );
  }
}
