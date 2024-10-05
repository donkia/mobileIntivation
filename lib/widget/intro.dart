import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Scaffold(
        body: Column(
          children: [
            const Text(
              '병현❤️슬기',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 512,
              height: 512,
              child: Image.asset(
                'assets/images/1.png',
                // height: 500,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              '2025년 1월 18일 토요일 오전 12시\n 레노스블랑쉬 블랑쉬홀',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              '6번째의 계절이 지나 \n 7번째 계절부터는 \n 함께하고자 합니다.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
