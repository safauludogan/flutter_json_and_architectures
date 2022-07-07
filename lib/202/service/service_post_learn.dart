import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_json_hardwareandro/202/service/post_model.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({Key? key}) : super(key: key);

  @override
  State<ServicePostLearn> createState() => _ServicePostLearnState();
}

class _ServicePostLearnState extends State<ServicePostLearn> {
  String? name;
  bool _isLoading = false;
  late final Dio _networkManagerDio;
  final _baseUrl = "https://jsonplaceholder.typicode.com/";

  late TextEditingController _titleController;
  late TextEditingController _bodyController;
  late TextEditingController _userIdController;

  @override
  void initState() {
    super.initState();
    _networkManagerDio = Dio(BaseOptions(baseUrl: _baseUrl));
    _titleController = TextEditingController();
    _bodyController = TextEditingController();
    _userIdController = TextEditingController();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  void _addItemToService(PostModel postModel) async {
    _changeLoading();
    final response = await _networkManagerDio.post('posts', data: postModel);

    if (response.statusCode == HttpStatus.created) {
      name = 'Başarılı';
    }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          _isLoading
              ? const CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.white)
              : const SizedBox.shrink()
        ],
      ),
      body: Column(
        children: [
          TextField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextField(
            textInputAction: TextInputAction.next,
            controller: _bodyController,
            decoration: const InputDecoration(labelText: 'Body'),
          ),
          TextField(
            controller: _userIdController,
            keyboardType: TextInputType.number,
            autofillHints: const [AutofillHints.creditCardNumber],
            decoration: const InputDecoration(labelText: 'UserId'),
          ),
          TextButton(
              onPressed: _isLoading
                  ? null
                  : () {
                      if (_titleController.text.isNotEmpty &&
                          _bodyController.text.isNotEmpty &&
                          _userIdController.text.isNotEmpty) {
                        var model = PostModel(
                            body: _bodyController.text,
                            title: _titleController.text,
                            userId: int.tryParse(_userIdController.text));
                        _addItemToService(model);
                      }
                    },
              child: const Text("Send"))
        ],
      ),
    );
  }
}
