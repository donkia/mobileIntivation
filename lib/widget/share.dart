import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart' as sharePlus;
import 'dart:js' as js;

class Share extends StatelessWidget {
  const Share({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF2F2F2),
      width: double.infinity,
      // padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          // const Text('항상 저희를 지켜봐주시고 지원해주신 부모님과 가족,'),
          // const SizedBox(
          //   height: 10,
          // ),
          // const Text('응원과 축하의 마음을 전해주신 모든 분들께'),
          // const SizedBox(
          //   height: 10,
          // ),
          // const Text('진심으로 감사드립니다.'),
          // const SizedBox(
          //   height: 10,
          // ),
          // const Text('항상 건강하시고 행복하시길 기원드립니다.'),
          // const SizedBox(
          //   height: 10,
          // ),
          /*
          OutlinedButton(
            onPressed: () {
              // 모바일청찹장 URL 복사
              Clipboard.setData(const ClipboardData(
                  text: 'https://donkia.github.io/mobileIntivation/'));
            },
            style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ),
                backgroundColor: Colors.transparent),
            child: const Text(
              '모바일 청첩장 주소 복사',
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          */
          OutlinedButton(
            onPressed: () {
              js.context.callMethod('shareKakao');
            },
            style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ),
                backgroundColor: Colors.transparent),
            child: const Text(
              '카카오톡으로 공유하기',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
