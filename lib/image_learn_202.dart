import 'package:flutter/material.dart';

class ImageLearn202 extends StatefulWidget {
  const ImageLearn202({Key? key}) : super(key: key);

  @override
  State<ImageLearn202> createState() => _ImageLearn202State();
}

class _ImageLearn202State extends State<ImageLearn202> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImagePaths.image_tree.toWidget(height: 300),
    );
  }
}

enum ImagePaths {
  //ignore: constant_identifier_names
  image_tree,
}

extension ImagePathsExtension on ImagePaths {
  String path() {
    return 'assets/images/$name.jpg';
  }

  Widget toWidget({double height = 24}){
    return Image.asset(path(),height: height,);
  }
}
