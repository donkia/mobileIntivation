import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:mobile_invitation/widget/guestBook.dart';

class Notice extends StatefulWidget {
  const Notice({super.key});

  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  bool _showGuestBook = false;
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  // GuestBook 토글 함수
  void _toggleGuestBook() {
    analytics.logEvent(
        name: 'button_click', parameters: {'button_name': '[버튼] 축하의 인사 남기기'});

    setState(() {
      _showGuestBook = !_showGuestBook;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('01',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: '- 레노스블랑쉬 웨딩홀은 '),
                    TextSpan(
                        text: '단독 홀',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' 입니다.'),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text('02',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: '- 식사는 '),
                    TextSpan(
                        text: '뷔페식',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' 입니다.'),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text('03',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: '- 주차는 '),
                    TextSpan(
                        text: '주차도장',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' 찍어 출차하시면 2시간이 무료입니다.'),
                  ],
                ),
              ),
              const Text('- 주차장은 본 건물 옆 지상 주차장에서 가능합니다.(약 150대 가능)'),
              const Text(
                  '- 현장 만차 시에는 안내받으신 후, 무학여고 주차장 또는 삼성스토어 옆 유료주차장 이용 가능합니다'),
              const Text('- 유료주차장 이용시에도 주차도장 적용이 가능합니다.'),
              const SizedBox(height: 10),
              const Text('04',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
              const Text('- 신랑, 신부에게 축하의 인사를 남겨주세요!'),
              const SizedBox(height: 20),
              Center(
                child: OutlinedButton(
                  onPressed: _toggleGuestBook,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.black, width: 1.0),
                    backgroundColor: Colors.transparent,
                  ),
                  child: const Text('축하의 인사 남기기',
                      style: TextStyle(color: Colors.black)),
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
        if (_showGuestBook)
          Positioned.fill(
            child: GestureDetector(
              onTap: _toggleGuestBook,
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
        if (_showGuestBook)
          Positioned.fill(
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: _toggleGuestBook,
                  ),
                ),
                Expanded(
                  child: GuestBook(
                      onSubmitted: _toggleGuestBook), // onSubmitted 추가
                ),
              ],
            ),
          ),
      ],
    );
  }
}
