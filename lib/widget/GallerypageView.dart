import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:lottie/lottie.dart';

class GalleryPageView extends StatefulWidget {
  const GalleryPageView({super.key});

  @override
  _GalleryPageViewState createState() => _GalleryPageViewState();
}

class _GalleryPageViewState extends State<GalleryPageView> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  bool _isLottieShown = false; // Track if Lottie animation was shown

  final List<String> imagePaths = [
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1731236303/15_mdacnf.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1731236309/14_v8qnqq.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1731236301/12_o9cubt.webp',

    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1731236302/13_jczufb.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1731236292/4_mojldd.webp',

    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1731236307/21_qrx6iv.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1731236299/10_dbb4cd.webp',

    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1731236295/6_khowex.webp',

    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1731236300/11_fdraoy.webp',

    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1731236304/17_fszw3n.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1731236297/9_lqcizj.webp',

    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1731236294/5_nukj9o.webp',

    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1731236296/8_i1kaw1.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1731236295/7_sczo6p.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1731236292/3_kx2zi4.webp',

    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1731236291/2_s7se1a.webp',

    // 18 : https://res.cloudinary.com/dzlinhsg8/image/upload/v1731236311/18_vzujye.webp
    // 19 : https://res.cloudinary.com/dzlinhsg8/image/upload/v1731236305/19_nlx6ii.webp
    // 16 : https://res.cloudinary.com/dzlinhsg8/image/upload/v1731236304/16_ilgvfo.webp
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 500,
            child: PageView.builder(
              controller: _pageController,
              itemCount: imagePaths.length,
              onPageChanged: (index) {
                if (index != 0) {
                  setState(() {
                    _isLottieShown =
                        true; // Set to true when leaving first page
                  });
                }
              },
              itemBuilder: (context, index) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.network(
                      imagePaths[index],
                      fit: BoxFit.contain,
                    ),
                    if (index == 0 && !_isLottieShown)
                      Positioned(
                        child: ColorFiltered(
                          colorFilter: const ColorFilter.mode(
                            Color.fromRGBO(
                                245, 224, 224, 1), // Specify the desired color
                            BlendMode.srcATop, // Blend mode to apply color
                          ),
                          child: Lottie.asset(
                            'assets/animations/swipe_hint.json',
                            width: 80,
                            height: 80,
                          ),
                        ),
                      ),
                  ],
                );
              },
            )),
        const SizedBox(height: 16),
        SmoothPageIndicator(
          controller: _pageController, // PageView의 controller와 동일하게 설정
          count: imagePaths.length, // 페이지 개수
          effect: const WormEffect(
            // 스타일 효과 설정
            dotHeight: 10,
            dotWidth: 10,
            activeDotColor: Color.fromRGBO(245, 224, 224, 1),
            dotColor: Color.fromRGBO(229, 229, 229, 1),
          ),
        ),
      ],
    );
  }
}
