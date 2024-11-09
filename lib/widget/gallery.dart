import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

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
  final cacheManager = CacheManager(Config('customCacheKey',
      stalePeriod: const Duration(days: 3),
      maxNrOfCacheObjects: 10)); // 캐시 설정 조정

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
    super.build(context);
    return //Stack(
        //children: [
        GridView.builder(
      cacheExtent: 500, // 화면 밖의 캐싱 범위 축소
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 1.0,
        mainAxisExtent: 150.0,
      ),
      itemCount: imagePaths.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Card(
            color: Colors.white,
            child: CachedNetworkImage(
              imageUrl: imagePaths[index],
              fit: BoxFit.cover,
              cacheManager: cacheManager,
              //placeholder: (context, url) =>
              //const Center(child: CircularProgressIndicator()),
              // errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        );
      },
    );

    // ],
    //);
  }

  @override
  bool get wantKeepAlive => true;
}
