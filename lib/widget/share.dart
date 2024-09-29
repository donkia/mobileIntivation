import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart' as sharePlus;

class Share extends StatelessWidget {
  const Share({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('공유하기'),
          onPressed: () {
            sharePlus.Share.share('Check'); //공유하기 실행
          },
        ),
      ),
    );
  }
}
