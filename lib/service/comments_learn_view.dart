import 'package:flutter/material.dart';
import 'package:flutter_json_hardwareandro/service/post_service.dart';

import 'comment_model.dart';


class CommentsLearnView extends StatefulWidget {
  const CommentsLearnView({Key? key, required this.postId}) : super(key: key);

  final int? postId;

  @override
  State<CommentsLearnView> createState() => _CommentsLearnViewState();
}

class _CommentsLearnViewState extends State<CommentsLearnView> {

  late final IPostService postService;
  bool _isLoading = false;
  List<CommentModel>? _commentsItem;

  @override
  void initState() {
    super.initState();
    postService = PostService();
    fetchItemsWithId(widget.postId ?? 0);
  }

  void fetchItemsWithId(int postId) async{
    _changeLoading();
    _commentsItem = await postService.fetchRelatedCommentWithPostId(postId);

    _changeLoading();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: _commentsItem?.length ?? 0,
        itemBuilder: (context, index) {
        return Card(child: Text(_commentsItem?[index].email ?? ''),);
      },),
    );
  }
}
