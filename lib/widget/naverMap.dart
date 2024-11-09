import 'dart:html' as html;
import 'dart:ui_web' as ui;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NaverMap extends StatefulWidget {
  const NaverMap({super.key});

  @override
  _NaverMapState createState() => _NaverMapState();
}

class _NaverMapState extends State<NaverMap> {
  @override
  void initState() {
    super.initState();

    // 'map-element' 타입을 등록
    ui.platformViewRegistry.registerViewFactory('map-element', (int viewId) {
      final iframe = html.IFrameElement()
        ..src = 'assets/assets/map.html'
        ..style.border = 'none' // IFrame 테두리 제거
        ..style.width = '100%' // 너비 100%
        ..style.height = '350px'; // 높이를 원하는 픽셀 값으로 설정
      return iframe;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(25.0),
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: 350, // `iframe`의 높이에 맞추어 위젯 높이 설정
          child: HtmlElementView(viewType: 'map-element'), // 등록된 viewType 사용
        ),
      ),
    );
  }
}
