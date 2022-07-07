import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_json_hardwareandro/202/service/comments_learn_view.dart';
import 'package:flutter_json_hardwareandro/202/service/post_model.dart';
import 'package:flutter_json_hardwareandro/202/service/post_service.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({Key? key}) : super(key: key);

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  List<PostModel>? _items;
  bool _isLoading = false;
  late final Dio _networkManagerDio;
  final _baseUrl = "https://jsonplaceholder.typicode.com/";

  // TEST EDİLEBİLRİ KOD BAŞLADI
  late final IPostService _postService;

  @override
  void initState() {
    super.initState();
    _networkManagerDio = Dio(BaseOptions(baseUrl: _baseUrl));
    _postService = PostService();
    fetchPostItemsAdvance();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  // Future<void> fetchPostItems() async {
  //   _changeLoading();
  //   final response =
  //       await Dio().get("https://jsonplaceholder.typicode.com/posts");
  //
  //   if (response.statusCode == HttpStatus.ok) {
  //     final _datas = response.data;
  //
  //     if (_datas is List) {
  //       setState(() {
  //         _items = _datas.map((e) => PostModel.fromJson(e)).toList();
  //       });
  //     }
  //   }
  //   _changeLoading();
  // }

  Future<void> fetchPostItemsAdvance() async {
    _changeLoading();
    _items = await _postService.fetchPostItemsAdvance();
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
      body: _items == null ? const Placeholder() : ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: _items?.length ?? 0,
        itemBuilder: (context, index) {
          return _PostCard(
            postModel: _items?[index],
          );
        },
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    Key? key,
    required PostModel? postModel,
  })  : _postModel = postModel,
        super(key: key);

  final PostModel? _postModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CommentsLearnView(postId: _postModel?.id)));
        },
        title: Text(_postModel?.title ?? ''),
        subtitle: Text(_postModel?.body ?? ''),
      ),
    );
  }
}
