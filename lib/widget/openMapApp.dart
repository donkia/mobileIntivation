import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// 지도 어플리케이션 오픈하는 위젯
class OpenMapApp extends StatelessWidget {
  const OpenMapApp({super.key});

  Future<void> _launchNaverMap() async {
    final Uri naverMapUri = Uri.parse(
        'nmap://place?lat=37.582510&lng=127.0344189&name=레노스블랑쉬&appname=com.example.myapp');
    //      center: new naver.maps.LatLng(37.582510, 127.0344189),//

    // URL을 실행할 수 있는지 확인
    if (await canLaunchUrl(naverMapUri)) {
      await launchUrl(naverMapUri);
    } else {
      // 앱이 설치되지 않았거나 실행할 수 없을 때 웹 브라우저로 이동
      final Uri fallbackUri = Uri.parse('https://naver.me/xevjyQIj');
      if (await canLaunchUrl(fallbackUri)) {
        await launchUrl(fallbackUri);
      } else {
        throw 'Could not launch $naverMapUri or $fallbackUri';
      }
    }
  }

  Future<void> _launchKakaoMap() async {
    final Uri kakaoMapUri = Uri.parse('https://place.map.kakao.com/24718969');
//      center: new naver.maps.LatLng(37.582510, 127.0344189),//

    // URL을 실행할 수 있는지 확인
    if (await canLaunchUrl(kakaoMapUri)) {
      await launchUrl(kakaoMapUri);
    } else {
      // 앱이 설치되지 않았거나 실행할 수 없을 때 웹 브라우저로 이동
      final Uri fallbackUri = Uri.parse(
          'https://map.kakao.com/link/map/레노스블랑쉬,37.566535,126.977969');
      if (await canLaunchUrl(fallbackUri)) {
        await launchUrl(fallbackUri);
      } else {
        throw 'Could not launch $kakaoMapUri or $fallbackUri';
      }
    }
  }

  // 티맵 지도 앱을 실행하는 함수
  Future<void> _launchTMap() async {
    final Uri tmapUri = Uri.parse(
        //'tmap://route?goalname=레노스블랑쉬웨딩홀&goalx=126.977969&goaly=37.566535');
        'tmap://route?goalname=레노스블랑쉬웨딩홀&goalx=126.977969&goaly=37.566535');

    // URL을 실행할 수 있는지 확인
    if (await canLaunchUrl(tmapUri)) {
      await launchUrl(tmapUri);
    } else {
      // 앱이 설치되지 않았거나 실행할 수 없을 때 웹 브라우저로 이동
      final Uri fallbackUri = Uri.parse('https://www.tmap.co.kr/tmap/mMain.do');
      if (await canLaunchUrl(fallbackUri)) {
        await launchUrl(fallbackUri);
      } else {
        throw 'Could not launch $tmapUri or $fallbackUri';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          IconButton(
            onPressed: () {
              _launchNaverMap();
            },
            icon: //const Text('네이버지도'),
                Image.asset(
              'assets/images/naverMap.png',
              height: 50,
            ),
          ),
          IconButton(
            onPressed: () {
              _launchKakaoMap();
            },
            icon: //const Text('카카오지도'),
                Image.asset(
              'assets/images/kakaoMap.png',
              height: 50,
              // height: 500,
            ),
          ),
          IconButton(
            onPressed: () {
              _launchTMap();
            },
            icon: //const Text('티맵'),
                Image.asset(
              'assets/images/tMap.png',
              height: 50,
              // height: 500,
            ),
          ),
        ]), /*
        const Column(
          children: [
            Text('지하철/버스'),
            Text('2호선, 5호선, 중앙선, 분당선 - 왕십리역 9번출구(도보 3분거리)'),
            Text('5호선 - 행당역 3번 출구(도보 3분거리 직진)'),
          ],
        ),
        const Column(
          children: [
            Text('주차'),
            Text('무학여고 주차장'),
          ],
        )*/
      ],
    );
  }
}
