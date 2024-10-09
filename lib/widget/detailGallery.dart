import 'package:flutter/material.dart';

class DetailGallery extends StatefulWidget {
  const DetailGallery({super.key, required this.index, required this.image});

  final int index;
  final List<String> image;

  @override
  State<StatefulWidget> createState() => _ImagePageState();
}

class _ImagePageState extends State<DetailGallery> {
  late int currentIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = widget.index; //초기 인덱스를 설정
  }

  void _nextImage() {
    setState(() {
      if (currentIndex < widget.image.length - 1) {
        currentIndex++;
      }
    });
  }

  void _previousImage() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      }
    });
  }

// 그리드뷰에만 이미지가 확대됨
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Center(
            //child: Image.asset(widget.image[currentIndex], fit: BoxFit.contain),
            child:
                Image.network(widget.image[currentIndex], fit: BoxFit.contain),
          ),
          Positioned(
              left: 20,
              top: MediaQuery.of(context).size.height / 2 - 20,
              child: IconButton(
                  onPressed: _previousImage,
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 40,
                    color: Colors.black,
                  ))),
          Positioned(
              right: 20,
              top: MediaQuery.of(context).size.height / 2 - 20,
              child: IconButton(
                  onPressed: _nextImage,
                  icon: const Icon(
                    Icons.arrow_forward,
                    size: 40,
                    color: Colors.black,
                  ))),

          /*
          Positioned(
              right: 20,
              top: 40,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop(); //닫기 버튼으로 다이얼로그 닫기
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 40,
                    color: Colors.black,
                  ))),
                  */
        ],
      ),
    );
  }
}
