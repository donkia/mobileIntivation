import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class GuestBook extends StatefulWidget {
  final VoidCallback onSubmitted;

  const GuestBook({super.key, required this.onSubmitted});

  @override
  _GuestBookState createState() => _GuestBookState();
}

class _GuestBookState extends State<GuestBook> {
  final _nameController = TextEditingController();
  final _messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _selectedRole;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      await _firestore.collection('guestbook').doc().set({
        "name": _nameController.text,
        "message": _messageController.text,
        "timestamp": FieldValue.serverTimestamp(),
        "type": _selectedRole
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('메시지가 제출되었습니다!')),
      );
      _nameController.clear();
      _messageController.clear();
      setState(() {
        _selectedRole = null;
      });

      widget.onSubmitted(); // 폼 제출 후 부모 위젯에서 스택을 닫도록 호출
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        '축하인사 전하기',
        style: GoogleFonts.notoSerif(fontSize: 14, fontWeight: FontWeight.w700),
      )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                    labelText: '작성자 이름', labelStyle: TextStyle(fontSize: 12)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '이름을 입력해주세요';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                    labelText: '축하인사 대상자', labelStyle: TextStyle(fontSize: 12)),
                value: _selectedRole,
                items: ['신랑', '신부'].map((role) {
                  return DropdownMenuItem(value: role, child: Text(role));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedRole = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return '축하인사 대상자를 선택해주세요.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _messageController,
                decoration: const InputDecoration(
                  labelText: '인사말을 남겨주세요!',
                  labelStyle: TextStyle(fontSize: 12),
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                minLines: 2,
                style: const TextStyle(fontSize: 10),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '메시지를 입력해주세요';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text(
                  '제출',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
