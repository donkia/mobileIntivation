import 'package:flutter/material.dart';

class Buttom extends StatelessWidget {
  const Buttom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xFFE2E2E1),
        width: double.infinity,
        // padding: const EdgeInsets.all(0),
        child: const Column(children: [
          SizedBox(
            height: 10,
          ),
          Text('Developed by 김병현.\nDesigned by 유슬기.'),
          SizedBox(
            height: 10,
          ),
        ]));
  }
}
