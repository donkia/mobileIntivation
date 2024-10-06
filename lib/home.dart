import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_invitation/widget/account.dart';
import 'package:mobile_invitation/widget/gallery.dart';
import 'package:mobile_invitation/widget/naverMap.dart';
import 'package:mobile_invitation/widget/openMapApp.dart';
import 'package:mobile_invitation/widget/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  double _opacity = 0.0;
  final double _scale = 1.0;

  late AnimationController _controller;
  late List<Animation<double>> _animations;
  final int _totalText = 5; // 애니메이션 총 텍스트 개수
  double _scrollPosition = 0.0;
  late ScrollController _scrollController;

  int getDday() {
    DateTime today = DateTime.now();
    DateTime targetDate = DateTime(2025, 1, 18);

    Duration differenceDate = targetDate.difference(today);
    return differenceDate.inDays > 0 ? differenceDate.inDays : 0;
  }

  void _onScroll() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    // 애니메이션 리스트 초기화
    _animations = List.generate(_totalText, (index) {
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Interval(index / _totalText, 1.0, curve: Curves.easeIn)),
      );
    });

    _controller.forward(); // 애니메이션 시작
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildAnimatedText(String text, int index) {
    // 스크롤에 따라 애니메이션이 적용되도록 조정
    double start = index * 250.0;
    double end = start + 250.0;

    double animateValue =
        (_scrollPosition - start / end - start).clamp(0.0, 1.0);
    return Opacity(
      opacity: animateValue,
      child: Transform.translate(
        offset: Offset(0, 50 * (1 - animateValue)),
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildAnimatedBoldText(String text, int index) {
    // 스크롤에 따라 애니메이션이 적용되도록 조정
    double start = index * 250.0;
    double end = start + 250.0;

    double animateValue =
        (_scrollPosition - start / end - start).clamp(0.0, 1.0);
    return Opacity(
      opacity: animateValue,
      child: Transform.translate(
        offset: Offset(0, 50 * (1 - animateValue)),
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
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
        body: NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollUpdateNotification) {
          setState(() {
            _opacity = (notification.metrics.pixels / 200).clamp(0.0, 1.0);
            // 스크롤 위치에 따라 크기 조절
            //_scale = 1 - (notification.metrics.pixels / 400).clamp(0.0, 0.3);
          });
        }
        return true;
      },
      child: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 512,
                height: 512,
                child: Image.asset(
                  'assets/images/3.jpg',
                  // height: 500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '김병현 | 유슬기',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '2025년 1월 18일 토요일 오전 12시',
                //style: TextStyle(fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                '레노스블랑쉬웨딩홀 블랑쉬홀',
                //style: TextStyle(fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 80,
              ),
              const Text(
                '[인사말]',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              _buildAnimatedText('6번째의 계절이 지나', 0),
              const SizedBox(
                height: 10,
              ),
              _buildAnimatedText('7번째 계절부터는', 1),
              const SizedBox(
                height: 10,
              ),
              _buildAnimatedText('함께하고자 합니다.', 2),
              const SizedBox(
                height: 20,
              ),
              AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(milliseconds: 3000),
                child: SizedBox(
                  width: 512,
                  height: 512,
                  child: Image.asset(
                    'assets/images/2.jpg',
                    // height: 500,
                  ),
                ),
              ),

              const SizedBox(
                height: 30,
              ),
              _buildAnimatedText(
                  '겨울의 따뜻한 햇살 아래\n 저희 두 사람이 소중한 분들을 모시고\n 사랑으로 하나되어\n 한길을 걸어가고자 합니다.',
                  3),
              /*
              const Text(
                '겨울의 따뜻한 햇살 아래\n 저희 두 사람이 소중한 분들을 모시고\n 사랑으로 하나되어\n 한길을 걸어가고자 합니다.',
                textAlign: TextAlign.center,
                maxLines: 5,
                //style: TextStyle(color: Color(0xff1877F2), fontSize: 19),
              ),
              */
              const SizedBox(
                height: 30,
              ),
              _buildAnimatedText(
                  '한곳을 바라보며 첫발을 내딛는 자리\n 그 시작에 함께해 주시면\n 더없는 기쁨으로 간직하겠습니다.', 4),
              /*
              const Text(
                '한곳을 바라보며 첫발을 내딛는 자리\n 그 시작에 함께해 주시면\n 더없는 기쁨으로 간직하겠습니다.',
                textAlign: TextAlign.center,
                maxLines: 5,
                //style: TextStyle(color: Color(0xff1877F2), fontSize: 19),
              ),
              */
              const SizedBox(
                height: 30,
              ),

              AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(milliseconds: 3000),
                child: SizedBox(
                  // width: 512,
                  //height: 512,
                  child: Image.asset(
                    'assets/images/19.jpg',
                    // height: 500,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
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
                height: 80,
              ),
              const Text(
                '[예식일시]',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 10,
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
                height: 80,
              ),
              const Text(
                '[갤러리]',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
              ),
              //사진 갤러리 보여주기
              Container(
                //  color: Colors.white,
                child: const SizedBox(
                  height: 750,
                  child: Gallery(),
                ),
              ),

              const SizedBox(
                height: 80,
              ),

              const Text(
                '[오시는길]',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                '서울특별시 성동구 행당동 319-36',
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('레노스블랑쉬웨딩홀'),
                  IconButton(
                      onPressed: () {
                        Clipboard.setData(
                            const ClipboardData(text: '서울특별시 성동구 행당동 319-36'));
                      },
                      icon: const Icon(
                        Icons.copy,
                        size: 10,
                      )),
                  /*
                  const Text(
                    '주소 복사하기',
                    style: TextStyle(fontSize: 9),
                  )
                  */
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
              // 네이버 지도
              const SizedBox(
                height: 400,
                child: NaverMap(),
              ),
              // 지도 어플리케이션 연동
              const OpenMapApp(),
              const SizedBox(
                height: 30,
              ),
              const Text(
                '[마음 전하실 곳]',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
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
                      '저희의 새로운 시작을\n축하해 주시는 모든 분들께\n진심으로 감사드립니다.\n행복하게 잘 살겠습니다.',
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
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
