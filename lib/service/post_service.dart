import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_json_hardwareandro/service/comment_model.dart';
import 'package:flutter_json_hardwareandro/service/post_model.dart';

abstract class IPostService {
  Future<bool> addItemToService(PostModel postModel);

  Future<bool> putItemToService(PostModel postModel, int id);

  Future<bool> deleteItemToService(int id);

  Future<List<PostModel>?> fetchPostItemsAdvance();

  Future<List<CommentModel>?> fetchRelatedCommentWithPostId(int postId);
}

class PostService implements IPostService {
  final Dio _networkManagerDio;

  PostService()
      : _networkManagerDio =
            Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));

  @override
  Future<bool> addItemToService(PostModel postModel) async {
    try {
      final response = await _networkManagerDio
          .post(_PostServicePaths.posts.name, data: postModel);

      return response.statusCode == HttpStatus.created;
    } on DioError catch (error) {
      _ShowDebug.showDioError(error,this);
    }
    return false;
  }

  @override
  Future<List<PostModel>?> fetchPostItemsAdvance() async {
    try {
      final response =
          await _networkManagerDio.get(_PostServicePaths.posts.name);

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is List) {
          return _datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (error) {
      _ShowDebug.showDioError(error,this);
    }
    return null;
  }

  @override
  Future<List<CommentModel>?> fetchRelatedCommentWithPostId(int postId) async {
    try {
      final response = await _networkManagerDio.get(
          _PostServicePaths.comments.name,
          queryParameters: {_PostQueryPaths.postId.name: postId});

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is List) {
          return _datas.map((e) => CommentModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (error) {
      _ShowDebug.showDioError(error,this);
    }
    return null;
  }

  @override
  Future<bool> putItemToService(PostModel postModel, int id) async {
    try {
      final response = await _networkManagerDio
          .put('${_PostServicePaths.posts.name}/$id', data: postModel);

      return response.statusCode == HttpStatus.ok;
    } on DioError catch (error) {
      _ShowDebug.showDioError(error,this);
    }
    return false;
  }

  @override
  Future<bool> deleteItemToService(int id) async {
    try {
      final response =
          await _networkManagerDio.put('${_PostServicePaths.posts.name}/$id');

      return response.statusCode == HttpStatus.ok;
    } on DioError catch (error) {
      _ShowDebug.showDioError(error,this);
    }
    return false;
  }
}

enum _PostServicePaths {
  posts,
  comments,
}
enum _PostQueryPaths {
  postId
}

class _ShowDebug {
  static void showDioError<T>(DioError error, T type) {
    if (kDebugMode) {
      debugPrint(error.message);
      debugPrint(type.toString());
      debugPrint("------");
    }
  }
}
