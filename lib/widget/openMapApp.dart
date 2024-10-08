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
        'https://tmap.life/02a96d0a');

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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            IconButton(
              onPressed: () {
                _launchNaverMap();
              },
              icon: //const Text('네이버지도'),
                  Image.network(
                'https://res.cloudinary.com/dzlinhsg8/image/upload/v1728594320/naverMap_khshgm.png',
                // height: 500,
                height: 30,
              ),
            ),
            IconButton(
              onPressed: () {
                _launchKakaoMap();
              },
              icon: //const Text('카카오지도'),
                  Image.network(
                'https://res.cloudinary.com/dzlinhsg8/image/upload/v1728594321/kakaoMap_bdq4bu.png',
                height: 30,
                // height: 500,
              ),
            ),
            IconButton(
              onPressed: () {
                _launchTMap();
              },
              icon: //const Text('티맵'),
                  Image.network(
                'https://res.cloudinary.com/dzlinhsg8/image/upload/v1728594321/tMap_bhmtuy.png',
                height: 30,
                // height: 500,
              ),
            ),
          ]),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start, //왼쪽 정렬 설정

            children: [
              Text(
                '지하철',
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: '- '),
                    TextSpan(
                      text: '2호선',
                      style: TextStyle(
                        color: Colors.green, // 원하는 색상
                      ),
                    ),
                    TextSpan(text: ', '),
                    TextSpan(
                      text: '5호선',
                      style: TextStyle(
                        color: Colors.purple, // 원하는 색상
                      ),
                    ),
                    TextSpan(text: ', '),
                    TextSpan(
                      text: '중앙선',
                      style: TextStyle(
                        color: Colors.blueAccent, // 원하는 색상
                      ),
                    ),
                    TextSpan(text: ', '),
                    TextSpan(
                      text: '분당선',
                      style: TextStyle(
                        color: Colors.yellow, // 원하는 색상
                      ),
                    ),
                    TextSpan(text: ' : 왕십리역 9번 출구(도보 3분거리) '),
                    //TextSpan(text: ' 입니다.'),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: '- '),
                    TextSpan(
                      text: '5호선',
                      style: TextStyle(
                        color: Colors.purple, // 원하는 색상
                      ),
                    ),
                    TextSpan(text: ' : 행당역 3번 출구(도보 3분거리 직진) '),
                    //TextSpan(text: ' 입니다.'),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '버스',
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Text('- 지선(초록) : 2016, 4211'),
              Text('- 간선(파랑) : 110A, 141, 145, 148, 241, 421, 463'),
              Text('- 마을버스 : 02, 03, 08'),
              Text('- 공항버스 : 6010(인천)'),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
