import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:mobile_invitation/widget/detailGallery.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ImageGridScreen());
  }
}

class ImageGridScreen extends StatefulWidget {
  const ImageGridScreen({super.key});

  @override
  _ImageGridScreenState createState() => _ImageGridScreenState();
}

class _ImageGridScreenState extends State<ImageGridScreen>
    with AutomaticKeepAliveClientMixin<ImageGridScreen> {
  int? selectedIndex;
/*
  final List<String> imagePaths = [
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729201842/12_wduffi.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729201840/2_pdb7km.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729201840/10_tpzfhi.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729201840/9_gnqnse.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729201840/1_o0jzqi.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729201839/11_e0mpel.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729201839/14_igvqrv.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729201839/3_m4vvht.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729201839/13_w1ts1z.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729201838/15_swxou3.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729201838/4_tyi5zq.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729201837/7_tlrlic.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729201837/16_lhojdj.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729201838/5_nm4igx.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729201837/17_keq3um.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729201837/18_opv375.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729201837/6_mr4yev.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729201837/8_jgzior.webp',
  ];
  */

  final List<String> imagePaths = [
    //'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729904925/18_fhsr0p.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729904920/12_xbchus.webp',
    // 'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729904922/16_e9uiwp.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729904922/15_cfvdzp.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729904921/14_mdlxp4.webp',

    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729904921/13_xdpqhy.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729904916/6_ecpcdh.webp',

    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729904920/11_xafjdi.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729904923/17_bgkb8o.webp',

    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729904918/10_nlzvg3.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729904917/9_wvg2p6.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729904917/5_hwlrbj.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729904917/8_ct5s9w.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729904917/7_dkll7w.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729904915/2_lonjtg.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729904915/4_rddsve.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729904915/3_fmslex.webp',
    // 'https://res.cloudinary.com/dzlinhsg8/image/upload/v1729904914/1_pftzdc.webp',
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);
    print('gridview 랜더링!');
    return Stack(
      children: [
        // GridView를 백그라운드에 배치
        GridView.builder(
          cacheExtent: 5000,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 1.0, mainAxisExtent: 150.0),
          itemCount: imagePaths.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index; // 선택된 인덱스를 저장
                });
              },
              child: Card(
                color: Colors.white,
                child: CachedNetworkImage(
                  imageUrl: imagePaths[index],
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            );
          },
        ),
        // 선택된 이미지가 있을 때만 상세 이미지를 보여줌
        if (selectedIndex != null) ...[
          // 백그라운드 블러 처리 (선택적으로)
          Container(
            color: Colors.black54, // 블러 효과를 주기 위한 반투명 배경
          ),
          // 상세 이미지 표시
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  setState(() {
                    selectedIndex = null; // 뒤로가기 버튼을 누르면 GridView로 돌아감
                  });
                },
              ),
            ),
            body: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = null; // 상세 이미지를 클릭하면 GridView로 돌아감
                      });
                    },
                    child: CachedNetworkImage(
                      imageUrl: imagePaths[selectedIndex!],
                      fit: BoxFit.contain,
                    ),
                  ),
                  // 왼쪽 화살표: 이전 이미지로 이동
                  Positioned(
                    left: 20,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          // 이전 이미지로 이동, 첫 번째 이미지에서는 마지막 이미지로 이동
                          selectedIndex =
                              (selectedIndex! - 1 + imagePaths.length) %
                                  imagePaths.length;
                        });
                      },
                      icon: const Icon(Icons.arrow_back,
                          color: Colors.white, size: 30),
                    ),
                  ),
                  // 오른쪽 화살표: 다음 이미지로 이동
                  Positioned(
                    right: 20,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          // 다음 이미지로 이동, 마지막 이미지는 첫 이미지로 돌아감
                          selectedIndex =
                              (selectedIndex! + 1) % imagePaths.length;
                        });
                      },
                      icon: const Icon(Icons.arrow_forward,
                          color: Colors.white, size: 30),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
