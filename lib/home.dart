import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_invitation/widget/account.dart';
import 'package:mobile_invitation/widget/gallery.dart';
import 'package:mobile_invitation/widget/naverMap.dart';
import 'package:mobile_invitation/widget/share.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  int getDday() {
    DateTime today = DateTime.now();
    DateTime targetDate = DateTime(2025, 1, 18);

    Duration differenceDate = targetDate.difference(today);
    return differenceDate.inDays;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*
        appBar: AppBar(
            title: const Text(
              '김병현 유슬기 1/18',
            ),
            centerTitle: true),
            */
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              '병현❤️슬기',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/images/1.jpg',
              // height: 500,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              '2025년 1월 18일 토요일 오전 11시\n 레노스블랑쉬 블랑쉬홀',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              '6번째의 계절이 지나 \n 7번째 계절부터는 \n 함께하고자 합니다.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/images/2.jpg',
              //height: 30,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              '겨울의 따뜻한 햇살 아래\n 저희 두 사람이 소중한 분들을 모시고\n 사랑으로 하나되어\n 한길을 걸어가고자 합니다.',
              textAlign: TextAlign.center,
              maxLines: 5,
              //style: TextStyle(color: Color(0xff1877F2), fontSize: 19),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              '한곳을 바라보며 첫발을 내딛는 자리\n 그 시작에 함께해 주시면\n 더없는 기쁨으로 간직하겠습니다.',
              textAlign: TextAlign.center,
              maxLines: 5,
              //style: TextStyle(color: Color(0xff1877F2), fontSize: 19),
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '김상동﹒최계봉',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text('의 아들'),
                Text(
                  '   병현',
                  style: TextStyle(fontWeight: FontWeight.w600),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '유성일﹒조선옥',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text('의   딸  '),
                Text(
                  '   슬기',
                  style: TextStyle(fontWeight: FontWeight.w600),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/images/3.jpg',
              //height: 30,
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              '1월',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),

            Image.asset(
              'assets/images/calendar.png',
              //height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '병현❤️슬기 결혼식이 ${getDday()}일 남았습니다.',
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            //사진 갤러리 보여주기
            Container(
              child: const SizedBox(
                height: 1000,
                child: Gallery(),
              ),
            ),

            const SizedBox(
              height: 30,
            ),
            const Text(
              '오시는길',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('서울특별시 성동구 행당동 319-36'),
                IconButton(
                    onPressed: () {
                      Clipboard.setData(
                          const ClipboardData(text: '서울특별시 성동구 행당동 319-36'));
                    },
                    icon: const Icon(
                      Icons.copy,
                      size: 10,
                    )),
                const Text(
                  '주소 복사하기',
                  style: TextStyle(fontSize: 9),
                )
              ],
            ),
/*
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Clipboard.setData(
                          const ClipboardData(text: '서울특별시 성동구 행당동 319-36'));
                    },
                    icon: const Icon(
                      Icons.copy,
                      size: 10,
                    )),
                const Text(
                  '주소 복사하기',
                  style: TextStyle(fontSize: 9),
                )
              ],
            ),
            */
            // 네이버지도 연동 임시 주석. 개발에 따른 사용량 증가
            const SizedBox(
              height: 400,
              child: NaverMap(),
            ),

            const SizedBox(
              height: 30,
            ),
            const Text(
              '마음 전하실 곳',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
            const Account(),
            const SizedBox(
              height: 20,
            ),

            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/images/18.jpg'),
                const Positioned(
                  top: 5,
                  //width: 100,
                  //height: 100,
                  //child: Image.asset('assets/images/4.jpg'),
                  child: Text(
                    '저희의 새로운 시작을\n 축하해 주시는 모든 분들께\n 진심으로 감사드립니다. \n 행복하게 잘 살겠습니다.',
                    maxLines: 5,
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w700),
                    //style: TextStyle(color: Color(0xff1877F2), fontSize: 19),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 30,
            ),
            //const Text('공유하기'),
            const SizedBox(
              height: 100,
              child: Share(),
            )
          ],
        ),
      ),
    ));
  }
}
