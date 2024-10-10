import 'package:flutter/material.dart';

class Notice extends StatelessWidget {
  const Notice({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, //왼쪽 정렬 설정
        children: [
          const Text(
            '01',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              //decoration: TextDecoration.underline
            ),
            //textAlign: TextAlign.start,
          ),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(text: '- 레노스블랑쉬 웨딩홀은 '),
                TextSpan(
                  text: '단독 홀',
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // 굵게
                    //color: Colors.red, // 원하는 색상
                  ),
                ),
                TextSpan(text: ' 입니다.'),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            '02',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              //decoration: TextDecoration.underline
            ),
            //textAlign: TextAlign.start,
          ),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(text: '- 식사는 '),
                TextSpan(
                  text: '뷔페식',
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // 굵게
                    //color: Colors.red, // 원하는 색상
                  ),
                ),
                TextSpan(text: ' 입니다. 마음껏 드셔주십쇼.'),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            '03',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              //decoration: TextDecoration.underline
            ),
            //textAlign: TextAlign.start,
          ),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(text: '- 주차는 '),
                TextSpan(
                  text: '주차도장',
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // 굵게
                    //color: Colors.red, // 원하는 색상
                  ),
                ),
                TextSpan(text: ' 찍어 출차하시면 2시간이 무료입니다.'),
              ],
            ),
          ),
          const Text('- 주차장은 본 건물 옆 지상 주차장에서 가능합니다.(약 150대 가능)'),
          const Text('- 현장 만차 시에는 안내받으신 후, 무학여고 주차장 또는 삼성스토어 옆 유료주차장 이용 가능합니다'),
          const Text('- 유료주차장 이용시에도 주차도장 적용이 가능합니다.'),
          const SizedBox(
            height: 10,
          ),
          const Text(
            '04',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              //decoration: TextDecoration.underline
            ),
            //textAlign: TextAlign.start,
          ),
          const Text('- 참석 의사 전달은 신랑,신부에게 큰 도움이 됩니다.'),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                  backgroundColor: Colors.transparent),
              child: const Text(
                '참석 의사 전달하기',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
