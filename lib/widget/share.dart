import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart' as sharePlus;
import 'dart:js' as js;

class Share extends StatelessWidget {
  const Share({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              child: const Text('모바일 청첩장 주소 복사'),
              onPressed: () {
                //sharePlus.Share.share('Check'); //공유하기 실행

                // 모바일청찹장 URL 복사
                Clipboard.setData(const ClipboardData(
                    text: 'https://donkia.github.io/mobileIntivation/'));
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              js.context.callMethod('shareKakao');
            },
            child: const Text('카카오톡으로 공유하기'),
          ),
        ],
      ),
    );
  }
}
