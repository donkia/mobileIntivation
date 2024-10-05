import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool menShowData = false;
  bool womenShowData = false;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
        width: 400,
        child: OutlinedButton(
          onPressed: () {
            setState(() {
              menShowData = !menShowData;
            });
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            //backgroundColor: Colors.black,
            side: const BorderSide(color: Colors.green, width: 1.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            //textStyle: const TextStyle(fontWeight: FontWeight.w700)
          ),
          child: const Text('신랑측 계좌번호'),
        ),
      ),
      const SizedBox(
        height: 2,
      ),
      if (menShowData)
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('신랑 김병현 : 신한은행 110475039706'),
                Row(
                    //width: 100,
                    //height: 100,
                    children: [
                      IconButton(
                          onPressed: () {
                            Clipboard.setData(
                                const ClipboardData(text: '110475039706'));
                          },
                          icon: const Icon(
                            Icons.copy,
                            size: 10,
                          )),
                    ]),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('신랑 아버지 : 신한은행 110475039706'),
                IconButton(
                    onPressed: () {
                      Clipboard.setData(
                          const ClipboardData(text: '110475039706'));
                    },
                    icon: const Icon(
                      Icons.copy,
                      size: 10,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('신랑 어머니 : 신한은행 110475039706'),
                IconButton(
                    onPressed: () {
                      Clipboard.setData(
                          const ClipboardData(text: '110475039706'));
                    },
                    icon: const Icon(
                      Icons.copy,
                      size: 10,
                    )),
              ],
            ),
          ],
        ),
      const SizedBox(height: 20),
      SizedBox(
        width: 400,
        child: OutlinedButton(
          onPressed: () {
            setState(() {
              womenShowData = !womenShowData;
            });
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            //backgroundColor: Colors.black,
            side: const BorderSide(color: Colors.pink, width: 1.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            //textStyle: const TextStyle(fontWeight: FontWeight.w700)
          ),
          child: const Text('신부측 계좌번호'),
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      if (womenShowData)
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('신부 유슬기 : 기업은행 110475039706'),
                IconButton(
                    onPressed: () {
                      Clipboard.setData(
                          const ClipboardData(text: '110475039706'));
                    },
                    icon: const Icon(
                      Icons.copy,
                      size: 10,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('신부 아버지 : 신한은행 110475039706'),
                IconButton(
                    onPressed: () {
                      Clipboard.setData(
                          const ClipboardData(text: '110475039706'));
                    },
                    icon: const Icon(
                      Icons.copy,
                      size: 10,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('신부 어머니 : 신한은행 110475039706'),
                IconButton(
                    onPressed: () {
                      Clipboard.setData(
                          const ClipboardData(text: '110475039706'));
                    },
                    icon: const Icon(
                      Icons.copy,
                      size: 10,
                    )),
              ],
            ),
          ],
        ),
    ]);
  }
}
