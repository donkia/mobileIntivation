import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_invitation/widget/account.dart';
import 'package:mobile_invitation/widget/bottom.dart';
import 'package:mobile_invitation/widget/customCalendar.dart';
import 'package:mobile_invitation/widget/gallery.dart';
import 'package:mobile_invitation/widget/loadingScreen.dart';
import 'package:mobile_invitation/widget/naverMap.dart';
import 'package:mobile_invitation/widget/notice.dart';
import 'package:mobile_invitation/widget/openMapApp.dart';
import 'package:mobile_invitation/widget/share.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  //final double _opacity = 0.0;
  //final double _scale = 1.0;

  //late AnimationController _controller;
  //late List<Animation<double>> _animations;
  final int _totalText = 5; // 애니메이션 총 텍스트 개수
  double _scrollPosition = 0.0;
  late ScrollController _scrollController;

  bool _isLoading = false; // 로딩 상태를 추적하는 변수

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
    //_scrollController = ScrollController();
    //_scrollController.addListener(_onScroll);

    //_controller = AnimationController(vsync: this, duration: const Duration(seconds: 3));

    // 애니메이션 리스트 초기화
    /*
    _animations = List.generate(_totalText, (index) {
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Interval(index / _totalText, 1.0, curve: Curves.easeIn)),
      );
    });
    */

    //_controller.forward(); // 애니메이션 시작

    // 이미지 로드 후 로딩 상태 변경
    // _loadImages();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //_controller.dispose();
    //  _scrollController.dispose();
    super.dispose();
  }

  void _loadImages() async {
    // 이미지 로드 시뮬레이션
    await Future.delayed(const Duration(seconds: 1)); // 이미지 로드를 기다림
    setState(() {
      _isLoading = false; // 로딩 완료
    });
  }

  // Widget _buildAnimatedText(String text, int index) {
  //   // 스크롤에 따라 애니메이션이 적용되도록 조정
  //   double start = index * 250.0;
  //   double end = start + 250.0;

  //   double animateValue =
  //       (_scrollPosition - start / end - start).clamp(0.0, 1.0);
  //   return Opacity(
  //     opacity: animateValue,
  //     child: Transform.translate(
  //       offset: Offset(0, 50 * (1 - animateValue)),
  //       child: Text(
  //         text,
  //         textAlign: TextAlign.center,
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildAnimatedBoldText(String text, int index) {
  //   // 스크롤에 따라 애니메이션이 적용되도록 조정
  //   double start = index * 250.0;
  //   double end = start + 250.0;

  //   double animateValue =
  //       (_scrollPosition - start / end - start).clamp(0.0, 1.0);
  //   return Opacity(
  //     opacity: animateValue,
  //     child: Transform.translate(
  //       offset: Offset(0, 50 * (1 - animateValue)),
  //       child: Text(
  //         text,
  //         textAlign: TextAlign.center,
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const LoadingScreen()
        : Scaffold(
            body: SingleChildScrollView(
            // controller: _scrollController,
            child: Column(
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     Text('김병현',
                //         style: GoogleFonts.notoSerif(
                //             textStyle: const TextStyle(fontSize: 24))),
                //     Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Text(
                //           "01",
                //           style: GoogleFonts.notoSerif(
                //               textStyle: const TextStyle(fontSize: 24),
                //               letterSpacing: 1.5,
                //               fontSize: 24),
                //           textAlign: TextAlign.center,
                //         ),
                //         Transform.rotate(
                //           angle: 0, //-0.7854, // -45 degrees in radians
                //           // child: const Divider(
                //           //   thickness: 20,
                //           //   color: Colors.black,
                //           //   indent: 20, // 적절히 조정
                //           //   endIndent: 20, // 적절히 조정
                //           // ),
                //           child: Text(
                //             "/",
                //             style: GoogleFonts.notoSerif(
                //                 textStyle: const TextStyle(fontSize: 40),
                //                 //  letterSpacing: 1.5,
                //                 fontSize: 24),
                //             textAlign: TextAlign.center,
                //           ),
                //         ),
                //         Text(
                //           "18",
                //           style: GoogleFonts.notoSerif(
                //               textStyle: const TextStyle(fontSize: 24),
                //               letterSpacing: 1.5,
                //               fontSize: 24),
                //           textAlign: TextAlign.center,
                //         ),
                //       ],
                //     ),
                //     Text('유슬기',
                //         style: GoogleFonts.notoSerif(
                //             textStyle: const TextStyle(fontSize: 24)))
                //   ],
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                SizedBox(
                  //  width: 512,
                  //height: 512,
                  child: Stack(
                    children: [
                      Image.network(
                        //'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729201839/3_m4vvht.webp',
                        'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729905546/19_rxpjdy.webp',
                        // height: 500,
                      ),
                      Positioned.fill(
                          child: Image.network(
                        'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729779457/snow_mmgitq.png',
                        fit: BoxFit.cover,
                        // height: 500,
                      ))
                    ],
                    //child:
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // const Text(
                //   '김병현 | 유슬기',
                //   textAlign: TextAlign.center,
                //   style: TextStyle(fontSize: 30),
                // ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  '2025년 1월 18일 토요일 12시',
                  //style: TextStyle(fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                  //style: GoogleFonts.notoSerif(),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '레노스블랑쉬웨딩홀 블랑쉬홀',
                  //style: GoogleFonts.notoSerif(),
                  //style: TextStyle(fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 80,
                ),
                // const Text(
                //   '[인사말]',
                //   textAlign: TextAlign.left,
                //   style: TextStyle(fontWeight: FontWeight.w700),
                // ),

                SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.network(
                    color: const Color.fromRGBO(245, 224, 224, 1),
                    //   'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729201840/2_pdb7km.webp',
                    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729895485/leaf1_tamo4w.png',
                    // height: 500,
                  ),
                ),

                // const Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 20),
                //   child: Divider(
                //     thickness: 1,
                //     color: Color.fromRGBO(245, 224, 224, 1),
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
                const Text('6번째의 겨울이 지나'),
                //_buildAnimatedText('6번째의 계절이 지나', 0),
                const SizedBox(
                  height: 10,
                ),
                //_buildAnimatedText('7번째 계절부터는', 1),
                const Text('7번째의 겨울부터는'),
                const SizedBox(
                  height: 10,
                ),
                //_buildAnimatedText('함께하고자 합니다.', 2),
                const Text('사랑의 결실을 맺고자합니다.'),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  //width: MediaQuery.of(context).size.width * 1,
                  //height: MediaQuery.of(context).size.width,
                  child: Image.network(
                    //   'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729201840/2_pdb7km.webp',
                    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729904922/16_e9uiwp.webp',
                    // height: 500,
                  ),
                ),
                /*
              AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(milliseconds: 2000),
                child: SizedBox(
                  width: 512,
                  height: 512,
                  child: Image.network(
                    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1728477075/2_dbpjqj.jpg',
                    // height: 500,
                  ),
                ),
              ),
            */
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  '대학교 어느 수업\n프로젝트에서 한팀이 되어 처음 만났습니다.\n이제는 한 가정으로써\n프로젝트를 다시 시작하려고 합니다.',
                  textAlign: TextAlign.center,
                ),
                /*
              _buildAnimatedText(
                  '대학교 어느 수업\n프로젝트에서 한팀이 되어 처음 만났습니다.\n 이제는 한 가정으로써\n 프로젝트를 다시 시작하려고 합니다.',
                  3),*/
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
                const Text(
                  '프로젝트가 성공적으로 오픈할 수 있도록\n참석하여 지혜와 용기를\n저희에게 나누어주십시오.',
                  textAlign: TextAlign.center,
                ),
                /*
              _buildAnimatedText(
                  '프로젝트가 성공적으로 오픈할 수 있도록\n 참석하여 지혜와 용기를\n 저희에게 나누어주십시오.', 4),
                  */
                /*
              const Text(
                '한곳을 바라보며 첫발을 내딛는 자리\n 그 시작에 함께해 주시면\n 더없는 기쁨으로 간직하겠습니다.',
                textAlign: TextAlign.center,
                maxLines: 5,
                //style: TextStyle(color: Color(0xff1877F2), fontSize: 19),
              ),
              */
                const SizedBox(
                  height: 50,
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
                SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.width,
                  child: Image.network(
                    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729904925/18_fhsr0p.webp',
                    // height: 500,
                  ),
                ),
                /*
              AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(milliseconds: 2000),
                child: SizedBox(
                  // width: 512,
                  //height: 512,
                  child: Image.network(
                    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1728477077/19_nlkfdx.jpg',
                    // height: 500,
                  ),
                ),
              ),
              */
                const SizedBox(
                  height: 20,
                ),
                // const Text(
                //   '[예식일시]',
                //   textAlign: TextAlign.left,
                //   style: TextStyle(fontWeight: FontWeight.w700),
                // ),
                // Text(
                //   'Callendar',
                //   textAlign: TextAlign.left,
                //   style: GoogleFonts.notoSerif(
                //       textStyle: const TextStyle(fontSize: 24),
                //       color: const Color.fromRGBO(
                //           245, 224, 224, 1) // 여기서 1은 불투명도를 의미합니다.
                //       ),
                // ),
                // const Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 20),
                //   child: Divider(
                //     thickness: 1,
                //     color: Color.fromRGBO(245, 224, 224, 1),
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),

                // const Text(
                //   '1월',
                //   style: TextStyle(fontWeight: FontWeight.w700),
                // ),
                const CustomCalendar(),
                const SizedBox(
                  height: 15,
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
                // const Text(
                //   '[갤러리]',
                //   textAlign: TextAlign.left,
                //   style: TextStyle(fontWeight: FontWeight.w700),
                // ),
                // Text(
                //   'Gallery',
                //   textAlign: TextAlign.left,
                //   style: GoogleFonts.notoSerif(
                //       textStyle: const TextStyle(fontSize: 24),
                //       color: const Color.fromRGBO(
                //           245, 224, 224, 1) // 여기서 1은 불투명도를 의미합니다.
                //       ),
                // ),
                // const Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 20),
                //   child: Divider(
                //       thickness: 1, color: Color.fromRGBO(245, 224, 224, 1)),
                // ),
                //사진 갤러리 보여주기
                const SizedBox(height: 750, child: Gallery()),

                const SizedBox(
                  height: 80,
                ),

                // const Text(
                //   '[오시는길]',
                //   textAlign: TextAlign.left,
                //   style: TextStyle(fontWeight: FontWeight.w700),
                // ),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.network(
                    color: const Color.fromRGBO(245, 224, 224, 1),
                    //   'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729201840/2_pdb7km.webp',
                    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729901963/location_ihcw6p.png',
                    // height: 500,
                  ),
                ),

                Text(
                  'Location',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.notoSerif(
                      textStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w700),
                      color: const Color.fromRGBO(
                          245, 224, 224, 1) // 여기서 1은 불투명도를 의미합니다.
                      ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                      thickness: 1, color: Color.fromRGBO(245, 224, 224, 1)),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '서울특별시 성동구 고산자로 202',
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('레노스블랑쉬웨딩홀 블랑쉬홀'),
                    IconButton(
                        onPressed: () {
                          Clipboard.setData(const ClipboardData(
                                  text: '서울특별시 성동구 고산자로 202'))
                              .then((_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('주소 복사가 완료되었습니다!')));
                          });
                        },
                        icon: const Icon(
                          Icons.copy,
                          size: 10,
                        )),
                  ],
                ),

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
                // const Text(
                //   '[안내사항]',
                //   textAlign: TextAlign.left,
                //   style: TextStyle(fontWeight: FontWeight.w700),
                // ),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.network(
                      color: const Color.fromRGBO(245, 224, 224, 1),
                      //   'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729201840/2_pdb7km.webp',
                      'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729902480/information2_in126f.png'
                      // height: 500,
                      ),
                ),
                Text(
                  'Information',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.notoSerif(
                      textStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w700),
                      color: const Color.fromRGBO(
                          245, 224, 224, 1) // 여기서 1은 불투명도를 의미합니다.
                      ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    thickness: 1,
                    color: Color.fromRGBO(245, 224, 224, 1),
                  ),
                ),
                const Notice(),
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
                  height: 10,
                ),
                const Account(),

                const SizedBox(
                  height: 10,
                ),

                SizedBox(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.4),
                          BlendMode.darken,
                        ),
                        child: Image.network(
                          'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729904914/1_pftzdc.webp',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Positioned(
                        //left: 16, // 왼쪽 여백
                        //left: MediaQuery.of(context).size.width / 2,

                        //top: MediaQuery.of(context).size.height / 2,
                        // 중간 위치 조정 (40은 텍스트 높이의 절반)
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('\n\n\n'),
                              Text(
                                '응원과 축하의 마음을 전해주신 모든 분들께',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8), // 줄 간격
                              Text(
                                '진심으로 감사드립니다.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8), // 줄 간격
                              Text(
                                '항상 건강하시고 행복하시길 기원드립니다.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const Share(),
                const Buttom()
              ],
            ),
          ));
  }
}
