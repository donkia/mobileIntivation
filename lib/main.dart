import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mobile_invitation/home.dart';
import 'firebase_options.dart'; // Firebase CLI로 생성된 파일

FirebaseAnalytics analytics = FirebaseAnalytics.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp(
//    options: DefaultFirebaseOptions.currentPlatform,
//  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // debugInvertOversizedImages = true;

    return MaterialApp(
      home: const FirebaseInit(),
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      theme: ThemeData(
          //   fontFamily: 'MaruBuri',
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white),
    );
  }
}

class FirebaseInit extends StatelessWidget {
  const FirebaseInit({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Firebase 초기화
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        // 초기화가 완료되었으면 홈 화면으로 이동
        if (snapshot.connectionState == ConnectionState.done) {
          return const Home();
        }

        // 초기화 중일 때 로딩 화면 표시
        return const Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //CircularProgressIndicator(),
                SpinKitPumpingHeart(
                  color: Colors.red,
                  size: 50,
                ),
                SizedBox(height: 20), // 간격
                Text('병현❤️슬기 청첩장을 준비 중입니다.'),
                Text('방문해주셔서 감사드립니다. 항상 행복하세요❤️'),
              ],
            ), // 로딩 애니메이션
          ),
        );
      },
    );
  }
}
