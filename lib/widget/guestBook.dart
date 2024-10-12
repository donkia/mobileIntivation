import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GuestBook extends StatefulWidget {
  const GuestBook({super.key});

  @override
  _GuestBookState createState() => _GuestBookState();
}

class _GuestBookState extends State<GuestBook> {
  final _nameController = TextEditingController();
  final _messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Firestore 컬렉션 참조
  CollectionReference guestbook =
      FirebaseFirestore.instance.collection('guestbook');

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      await _firestore.collection('guestbook').doc().set({
        "name": _nameController.text,
        "message": _messageController.text,
        "timestamp": FieldValue.serverTimestamp(),
        "type": '1'
      });

      // await guestbook.doc('AV9LVH2LQ4QXhdcDdcz3').set({
      //   'name': _nameController.text,
      //   'message': _messageController.text,
      //   'timestamp': FieldValue.serverTimestamp(),
      //   'type': '1'
      // });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('메시지가 제출되었습니다!')),
      );
      _nameController.clear();
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('방명록')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: '이름'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '이름을 입력해주세요';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _messageController,
                decoration: const InputDecoration(labelText: '메시지'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '메시지를 입력해주세요';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('제출'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
