import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class Gallery extends StatelessWidget {
  Gallery({super.key});

  int? selectedIndex;

  final List<String> imagePaths = [
    //  'https://res.cloudinary.com/dzlinhsg8/image/upload/v1730032061/12_1_ahxkno.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1730032054/15_1_mh2igl.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1730032060/14_1_kwgd9c.webp',
    /*
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
    */
  ];

  @override
  Widget build(BuildContext context) {
    return // Stack(
        //children: [
        // GridView를 백그라운드에 배치
        GridView.builder(
      //cacheExtent: 1000,
      //   physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 1.0, mainAxisExtent: 150.0),
      itemCount: imagePaths.length,
      itemBuilder: (context, index) {
        return Image.network(
          imagePaths[index],
          fit: BoxFit.cover,

          /*                
              CachedNetworkImage(
                imageUrl: imagePaths[index],
                fit: BoxFit.cover,
                memCacheHeight: 150,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              */
        );
      },
    );
    // 선택된 이미지가 있을 때만 상세 이미지를 보여줌
    /*
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
   //   ],
  //  );
  */
  }
}

/*
class ImageGridScreen extends StatefulWidget {
  const ImageGridScreen({super.key});

  @override
  _ImageGridScreenState createState() => _ImageGridScreenState();
}

class _ImageGridScreenState extends State<ImageGridScreen>
    with AutomaticKeepAliveClientMixin<ImageGridScreen> {
  int? selectedIndex;
  final cacheManager = CacheManager(Config('customCacheKey',
      stalePeriod: const Duration(days: 7), maxNrOfCacheObjects: 20));

  final List<String> imagePaths = [
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1730032061/12_1_ahxkno.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1730032054/15_1_mh2igl.webp',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1730032060/14_1_kwgd9c.webp',
    /*
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
    */
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);
    //print('gridview 랜더링!');
    return Stack(
      children: [
        // GridView를 백그라운드에 배치
        GridView.builder(
          //cacheExtent: 1000,
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
                  memCacheHeight: 150,
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
*/