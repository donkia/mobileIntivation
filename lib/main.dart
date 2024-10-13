import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_invitation/home.dart';
import 'package:mobile_invitation/widget/loadingScreen.dart';
import 'firebase_options.dart'; // Firebase CLI로 생성된 파일

void main() async {
  /*
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
*/
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen(); // 로딩 화면을 보여줍니다.
          }
          if (snapshot.hasError) {
            return const Scaffold(
              body: Center(
                child: Text('오류가 발생했습니다.'),
              ),
            );
          }
          return const Home(); // Firebase가 초기화되면 홈 화면으로 이동
        },
      ),
      theme: ThemeData(
          fontFamily: 'MaruBuri',
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white),
    );
  }
}
