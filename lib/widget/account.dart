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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          width: 400,
          child: OutlinedButton(
            onPressed: () {
              setState(() {
                menShowData = !menShowData;
              });
            },
            style: OutlinedButton.styleFrom(
              //foregroundColor: Colors.black,
              backgroundColor: const Color(0xFFE6F7F8),
              side: const BorderSide(color: Color(0xFFE6F7F8)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              //textStyle: const TextStyle(fontWeight: FontWeight.w700)
            ),
            child: const Text(
              '신랑측 계좌번호',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        if (menShowData)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: const Color(0x80E6F7F8),
                child: Row(
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
              ),
              Container(
                color: const Color(0x80E6F7F8),
                child: Row(
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
              ),
              Container(
                color: const Color(0x80E6F7F8),
                child: Row(
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
              ),
            ],
          ),
        const SizedBox(height: 10),
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
              backgroundColor: const Color(0xFFFFF1F1),
              side: const BorderSide(color: Color(0xFFFFF1F1), width: 1.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              //textStyle: const TextStyle(fontWeight: FontWeight.w700)
            ),
            child: const Text('신부측 계좌번호'),
          ),
        ),
        if (womenShowData)
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: const Color(0x80FFF1F1),
                child: Row(
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
              ),
              Container(
                color: const Color(0x80FFF1F1),
                child: Row(
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
              ),
              Container(
                color: const Color(0x80FFF1F1),
                child: Row(
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
              ),
            ],
          ),
      ]),
    );
  }
}
