import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SharedContextLearn extends StatefulWidget {
  const SharedContextLearn({Key? key}) : super(key: key);

  @override
  State<SharedContextLearn> createState() => _SharedContextLearnState();
}

enum _SecureKeys { token }

class _SharedContextLearnState extends State<SharedContextLearn> {
  final _storage = const FlutterSecureStorage();
  String _title = '';

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    getSecureItems();
  }

  Future<void> getSecureItems() async {
    _title = await _storage.read(key: _SecureKeys.token.name) ?? '';

    if (_title.isNotEmpty) {
      _controller.text = _title;
    }

    setState(() {});
  }

  void saveItems(String data) {
    setState(() {
      _title = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await _storage.write(key: _SecureKeys.token.name, value: _title);
        },
        label: const Text('Save'),
      ),
      body: TextField(
        controller: _controller,
        onChanged: saveItems,
      ),
    );
  }
}
