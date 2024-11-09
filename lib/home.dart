import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_invitation/widget/account.dart';
import 'package:mobile_invitation/widget/bottom.dart';
import 'package:mobile_invitation/widget/customCalendar.dart';
import 'package:mobile_invitation/widget/gallery.dart';
import 'package:mobile_invitation/widget/naverMap.dart';
import 'package:mobile_invitation/widget/notice.dart';
import 'package:mobile_invitation/widget/openMapApp.dart';
import 'package:mobile_invitation/widget/share.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  int getDday() {
    DateTime today = DateTime.now();
    DateTime targetDate = DateTime(2025, 1, 18);

    Duration differenceDate = targetDate.difference(today);
    return differenceDate.inDays > 0 ? differenceDate.inDays : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729905546/19_rxpjdy.webp',
                  //  width: 512,
                  // height: 512,
                )
                // Image.network(
                //   //'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729201839/3_m4vvht.webp',
                //   'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729905546/19_rxpjdy.webp',
                //   // height: 500,
                // ),
                ,
                Positioned.fill(
                    child: CachedNetworkImage(
                  imageUrl:
                      'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729779457/snow_mmgitq.png',
                  fit: BoxFit.cover,
//                  width: 512,
                  //  height: 512,
                )

                    //     Image.network(
                    //   'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729779457/snow_mmgitq.png',
                    //   fit: BoxFit.cover,
                    //   // height: 500,
                    // )

                    )
              ],
              //child:
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          const SizedBox(
            height: 20,
          ),
          Text(
            '2025년 1월 18일 토요일 12시',
            //style: TextStyle(fontWeight: FontWeight.w700),
            style: GoogleFonts.notoSerif(),
            textAlign: TextAlign.center,
            //style: GoogleFonts.notoSerif(),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '레노스블랑쉬웨딩홀 블랑쉬홀',
            //style: GoogleFonts.notoSerif(),
            //style: TextStyle(fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSerif(),
          ),
          const SizedBox(
            height: 80,
          ),

          SizedBox(
              child: CachedNetworkImage(
            imageUrl:
                'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729895485/leaf1_tamo4w.png',
            color: const Color.fromRGBO(245, 224, 224, 1),
            width: 50,
            height: 50,
          )

              //  Image.network(
              //   color: const Color.fromRGBO(245, 224, 224, 1),
              //   //   'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729201840/2_pdb7km.webp',
              //   'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729895485/leaf1_tamo4w.png',
              //   // height: 500,
              // ),
              ),

          const SizedBox(
            height: 20,
          ),
          Text(
            '6번째의 겨울이 지나',
            style: GoogleFonts.notoSerif(),
          ),
          //_buildAnimatedText('6번째의 계절이 지나', 0),
          const SizedBox(
            height: 10,
          ),
          //_buildAnimatedText('7번째 계절부터는', 1),
          Text(
            '7번째의 겨울부터는',
            style: GoogleFonts.notoSerif(),
          ),
          const SizedBox(
            height: 10,
          ),
          //_buildAnimatedText('함께하고자 합니다.', 2),
          Text(
            '사랑의 결실을 맺고자합니다.',
            style: GoogleFonts.notoSerif(),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              child: CachedNetworkImage(
            imageUrl:
                'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729904922/16_e9uiwp.webp',
            //    width: 512,
            //height: 512
          )

              // Image.network(
              //   //   'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729201840/2_pdb7km.webp',
              //   'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729904922/16_e9uiwp.webp',
              //   // height: 500,
              // ),
              ),
          const SizedBox(
            height: 30,
          ),
          Text(
            '대학교 어느 수업\n프로젝트에서 한팀이 되어 처음 만났습니다.\n이제는 한 가정으로써\n프로젝트를 다시 시작하려고 합니다.',
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSerif(),
          ),

          const SizedBox(
            height: 30,
          ),
          Text(
            '프로젝트가 성공적으로 오픈할 수 있도록\n참석하여 지혜와 용기를\n저희에게 나누어주십시오.',
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSerif(),
          ),

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
              child: CachedNetworkImage(
            imageUrl:
                'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729904925/18_fhsr0p.webp',
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.width,
          )

              // Image.network(
              //   'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729904925/18_fhsr0p.webp',
              //   // height: 500,
              // ),
              ),

          const SizedBox(
            height: 20,
          ),

          const SizedBox(
            height: 10,
          ),

          const CustomCalendar(),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '병현❤️슬기 결혼식이 ${getDday()}일 남았습니다.',
                style: GoogleFonts.notoSerif(fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(
            height: 80,
          ),

          //사진 갤러리 보여주기
          const SizedBox(height: 750, child: Gallery()),

          const SizedBox(
            height: 80,
          ),

          SizedBox(
              child: CachedNetworkImage(
            imageUrl:
                'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729901963/location_ihcw6p.png',
            width: 30,
            height: 30,
            color: const Color.fromRGBO(245, 224, 224, 1),
          )

              // Image.network(
              //   color: const Color.fromRGBO(245, 224, 224, 1),
              //   //   'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729201840/2_pdb7km.webp',
              //   'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729901963/location_ihcw6p.png',
              //   // height: 500,
              // ),
              ),

          Text(
            'Location',
            textAlign: TextAlign.left,
            style: GoogleFonts.notoSerif(
                textStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                color: const Color.fromRGBO(
                    245, 224, 224, 1) // 여기서 1은 불투명도를 의미합니다.
                ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child:
                Divider(thickness: 1, color: Color.fromRGBO(245, 224, 224, 1)),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '서울특별시 성동구 고산자로 202',
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSerif(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '레노스블랑쉬웨딩홀 블랑쉬홀',
                style: GoogleFonts.notoSerif(),
              ),
              IconButton(
                  onPressed: () {
                    Clipboard.setData(
                            const ClipboardData(text: '서울특별시 성동구 고산자로 202'))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                        '주소 복사가 완료되었습니다!',
                        style: GoogleFonts.notoSerif(),
                      )));
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

          SizedBox(
              child: CachedNetworkImage(
            imageUrl:
                'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729902480/information2_in126f.png',
            color: const Color.fromRGBO(245, 224, 224, 1),
            width: 30,
            height: 30,
          )

              //  Image.network(
              //     color: const Color.fromRGBO(245, 224, 224, 1),
              //     //   'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729201840/2_pdb7km.webp',
              //     'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729902480/information2_in126f.png'
              //     // height: 500,
              //     ),
              ),
          Text(
            'Information',
            textAlign: TextAlign.left,
            style: GoogleFonts.notoSerif(
                textStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
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
          Text(
            '[마음 전하실 곳]',
            textAlign: TextAlign.left,
            style: GoogleFonts.notoSerif(fontWeight: FontWeight.w700),
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
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729904914/1_pftzdc.webp',
                      fit: BoxFit.cover,
                      height: 512,
                      width: 512,
                    )

                    // Image.network(
                    //   'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729904914/1_pftzdc.webp',
                    //   fit: BoxFit.cover,
                    // ),
                    ),
                Positioned(
                  //left: 16, // 왼쪽 여백
                  //left: MediaQuery.of(context).size.width / 2,

                  //top: MediaQuery.of(context).size.height / 2,
                  // 중간 위치 조정 (40은 텍스트 높이의 절반)
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('\n\n\n'),
                        Text(
                          '응원과 축하의 마음을 전해주신 모든 분들께',
                          style: GoogleFonts.notoSerif(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8), // 줄 간격
                        Text(
                          '진심으로 감사드립니다.',
                          style: GoogleFonts.notoSerif(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8), // 줄 간격
                        Text(
                          '항상 건강하시고 행복하시길 기원드립니다.',
                          style: GoogleFonts.notoSerif(
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
