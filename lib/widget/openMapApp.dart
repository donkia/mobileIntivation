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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch, // 부모 위젯의 전체 너비 사용

      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          IconButton(
            onPressed: () {
              _launchNaverMap();
            },
            icon: //const Text('네이버지도'),
                Image.network(
              'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729201836/naverMap_q8fiud.webp',
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
              'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729201836/kakaoMap_djfsrm.webp',
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
              'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729201836/tMap_mlmeos.webp',
              height: 30,
              // height: 500,
            ),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //왼쪽 정렬 설정

            children: [
              Row(
                children: [
                  Image.network(
                    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729990085/subway_wxoaiu.webp',
                    height: 25, // 이미지 크기 설정
                  ),
                  const Text(
                    '  지하철',
                    // textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                  ),
                ],
              ),
              const Text.rich(
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
                        color: Color(0xFF76B69B), // 원하는 색상
                      ),
                    ),
                    TextSpan(text: ', '),
                    TextSpan(
                      text: '분당선',
                      style: TextStyle(color: Color(0xFFDBA829) // 원하는 색상
                          ),
                    ),
                    TextSpan(text: ' : 왕십리역 9번 출구(도보 3분거리) '),
                    //TextSpan(text: ' 입니다.'),
                  ],
                ),
              ),
              const Text.rich(
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
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Image.network(
                    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729897164/bus_c73vik.png',
                    height: 30,
                    // height: 500,
                  ),
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: ' 버스',
                          style: TextStyle(
                              //color: Colors.purple, // 원하는 색상
                              fontWeight: FontWeight.w700),
                        ),
                        TextSpan(text: ' : 무학여고 하차'),
                        //TextSpan(text: ' 입니다.'),
                      ],
                    ),
                  ),
                ],
              ),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: ' '),
                    TextSpan(
                      text: '●',
                      style: TextStyle(
                          color: Color.fromRGBO(61, 195, 68, 1), // 원하는 색상
                          fontWeight: FontWeight.w700),
                    ),
                    TextSpan(text: ' 지선버스 : 2016, 4211'),
                    //TextSpan(text: ' 입니다.'),
                  ],
                ),
              ), //61, 195, 68
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: ' '),
                    TextSpan(
                      text: '●',
                      style: TextStyle(
                          color: Color.fromRGBO(56, 109, 232, 1), // 원하는 색상
                          fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                        text: ' 간선버스 : 110A, 141, 145, 148, 241, 421, 463'),
                    //TextSpan(text: ' 입니다.'),
                  ],
                ),
              ),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: ' '),
                    TextSpan(
                      text: '●',
                      style: TextStyle(
                          color: Color.fromRGBO(61, 195, 68, 1), // 원하는 색상
                          fontWeight: FontWeight.w700),
                    ),
                    TextSpan(text: ' 마을버스 : 성동02, 성동08'),
                    //TextSpan(text: ' 입니다.'),
                  ],
                ),
              ),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: ' '),
                    TextSpan(
                      text: '●',
                      style: TextStyle(
                          color: Color.fromRGBO(101, 166, 210, 1), // 원하는 색상
                          fontWeight: FontWeight.w700),
                    ),
                    TextSpan(text: ' 공항버스 : 6010(인천)'),
                    //TextSpan(text: ' 입니다.'),
                  ],
                ),
              ),
              // Text('- 지선(초록) : 2016, 4211'),
              // Text('- 간선(파랑) : 110A, 141, 145, 148, 241, 421, 463'),
              // Text('- 마을버스 : 성동02, 성동08'),
              // Text('- 공항버스 : 6010(인천)'),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
