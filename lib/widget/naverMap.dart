import 'dart:html' as html;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

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
        ..style.border = 'none'; // IFrame 테두리 제거
      return iframe;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HtmlElementView(viewType: 'map-element'), // 등록된 viewType 사용
    );
  }
}
