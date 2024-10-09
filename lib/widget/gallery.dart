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
  @override
  bool get wantKeepAlive => true;
/*
  final List<String> imagePaths = [
    'assets/images/3.jpg',
    'assets/images/16.jpg',
    'assets/images/7.jpg',
    'assets/images/5.jpg',
    'assets/images/8.jpg',
    'assets/images/9.jpg',
    'assets/images/10.jpg',
    'assets/images/11.jpg',
    'assets/images/12.jpg',
    'assets/images/13.jpg',
    'assets/images/14.jpg',
    'assets/images/17.jpg',
    'assets/images/4.jpg',
    'assets/images/15.jpg',
    'assets/images/6.jpg',
  ];
  */
  final List<String> imagePaths = [
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1728477075/3_kfb4po.jpg',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1728477075/16_btbnfa.jpg',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1728477076/7_g1paj8.jpg',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1728477076/5_kjwvwv.jpg',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1728477077/8_nw4exw.jpg',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1728477078/9_rhbgx1.jpg',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1728477078/10_ywfdel.jpg',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1728477078/11_gzea2d.jpg',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1728477078/12_pbzmy0.jpg',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1728477079/13_kv3puh.jpg',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1728477078/14_z3zbai.jpg',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1728477076/17_qmpmc2.jpg',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1728477076/4_ehjbii.jpg',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1728477075/15_s7h5a7.jpg',
    'https://res.cloudinary.com/dzlinhsg8/image/upload/v1728477077/6_ekbxbh.jpg',
  ];
  /*
  final List<String> imagePaths = [
    'https://firebasestorage.googleapis.com/v0/b/mobileinvitation-b37b2.appspot.com/o/3.jpg?alt=media&token=cc8f5322-d49a-46eb-9b66-b0584458b4e7',
    'https://firebasestorage.googleapis.com/v0/b/mobileinvitation-b37b2.appspot.com/o/16.jpg?alt=media&token=4310657c-c2dc-4cf6-b603-47c8d256dfb4',
    'https://firebasestorage.googleapis.com/v0/b/mobileinvitation-b37b2.appspot.com/o/7.jpg?alt=media&token=1a88c2d7-7fef-4230-b311-bfd3632c5e74',
    'https://firebasestorage.googleapis.com/v0/b/mobileinvitation-b37b2.appspot.com/o/5.jpg?alt=media&token=3f9db0c6-11c0-400a-a0ca-0c800d98ef89',
    'https://firebasestorage.googleapis.com/v0/b/mobileinvitation-b37b2.appspot.com/o/8.jpg?alt=media&token=d33125df-c44a-40f1-877d-8bff66c95627',
    'https://firebasestorage.googleapis.com/v0/b/mobileinvitation-b37b2.appspot.com/o/9.jpg?alt=media&token=0ce9095e-d06c-461e-bc3c-7a1ef187a11c',
    'https://firebasestorage.googleapis.com/v0/b/mobileinvitation-b37b2.appspot.com/o/10.jpg?alt=media&token=d09e4173-f709-40b8-9f65-2621d07a26d2',
    'https://firebasestorage.googleapis.com/v0/b/mobileinvitation-b37b2.appspot.com/o/11.jpg?alt=media&token=1a43e059-6fb8-45d3-817b-ef9c21b06182',
    'https://firebasestorage.googleapis.com/v0/b/mobileinvitation-b37b2.appspot.com/o/12.jpg?alt=media&token=17ea6a39-6e11-4a2d-933a-ab57e346c166',
    'https://firebasestorage.googleapis.com/v0/b/mobileinvitation-b37b2.appspot.com/o/13.jpg?alt=media&token=30c436d2-063e-436e-84ea-264a691c20fb',
    'https://firebasestorage.googleapis.com/v0/b/mobileinvitation-b37b2.appspot.com/o/14.jpg?alt=media&token=acee4883-913b-4f28-8890-612630f3e8a5',
    'https://firebasestorage.googleapis.com/v0/b/mobileinvitation-b37b2.appspot.com/o/17.jpg?alt=media&token=ff84bf65-46ed-4d6b-872c-c86d5cc8ecb3',
    'https://firebasestorage.googleapis.com/v0/b/mobileinvitation-b37b2.appspot.com/o/4.jpg?alt=media&token=bf3e9ba3-48bd-40fc-80bb-7c24ab98ab82',
    'https://firebasestorage.googleapis.com/v0/b/mobileinvitation-b37b2.appspot.com/o/15.jpg?alt=media&token=60070f65-e50a-417f-b95a-0f800f5f2c06',
    'https://firebasestorage.googleapis.com/v0/b/mobileinvitation-b37b2.appspot.com/o/6.jpg?alt=media&token=1abcc8f3-7a6d-4c11-96a4-fd2e6ff105b7',
  ];*/

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 1.0, mainAxisExtent: 150.0),
          itemCount: imagePaths.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailGallery(
                                image: imagePaths,
                                index: index,
                              ))).then((_) {
                    setState(() {});
                  });
                },
                child: Card(
                    color: Colors.white,
                    //child: Image.asset(imagePaths[index], fit: BoxFit.cover)),
                    child: CachedNetworkImage(
                      imageUrl: imagePaths[index],
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                          //    child: CircularProgressIndicator(),
                          ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    )
                    //(child: Image.network(imagePaths[index], fit: BoxFit.cover))),
                    ));
          }),
    );
  }
}
