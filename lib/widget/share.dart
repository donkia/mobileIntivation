import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart' as sharePlus;
import 'dart:js' as js;

class Share extends StatelessWidget {
  const Share({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

    return Container(
      color: const Color(0xFFF2F2F2),
      width: double.infinity,
      // padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          OutlinedButton(
            onPressed: () {
              analytics.logEvent(
                  name: 'button_click',
                  parameters: {'button_name': '[버튼] 카카오톡 공유하기'});
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
