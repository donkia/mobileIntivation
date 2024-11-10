import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GalleryPageView extends StatefulWidget {
  const GalleryPageView({super.key});

  @override
  _GalleryPageViewState createState() => _GalleryPageViewState();
}

class _GalleryPageViewState extends State<GalleryPageView> {
  final PageController _pageController = PageController(viewportFraction: 0.9);

  final List<String> imagePaths = [
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1730032061/12_1_ahxkno.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1730032054/15_1_mh2igl.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1730032060/14_1_kwgd9c.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1730032056/13_1_jrpijc.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1730032051/6_1_qkpld6.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1730032046/11_1_joqpkn.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1730032042/17_1_rw98i7.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1730032047/10_1_kxrlzk.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1730032041/9_1_izl4xr.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1730032058/5_1_yiguq0.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1730032050/8_1_zajbwl.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1730032052/7_1_iskity.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1730032055/2_1_kkxm1w.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1730032042/4_1_pbsvxf.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1730032049/3_1_p36u1i.webp',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 500,
          child: PageView.builder(
            itemCount: imagePaths.length,
            controller: _pageController,
            itemBuilder: (context, index) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    imagePaths[index],
                    fit: BoxFit.contain,
                  ),
                  const Positioned(
                    bottom: 10,
                    child: AnimatedOpacity(
                      opacity: 1.0,
                      duration: Duration(milliseconds: 500),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
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
