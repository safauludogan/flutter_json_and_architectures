import 'package:flutter/material.dart';
import 'package:flutter_json_hardwareandro/package_learn_view.dart';
import 'package:flutter_json_hardwareandro/sheet_learn.dart';
import 'package:flutter_json_hardwareandro/state_manage/state_manage_learn_view.dart';
import 'package:flutter_json_hardwareandro/theme/light_theme.dart';
import 'package:flutter_json_hardwareandro/theme_learn_view.dart';
import 'package:flutter_json_hardwareandro/widget_size_enum_learn_view.dart';

import 'alert_learn.dart';
import 'animated_learn.dart';
import 'cache/secure_context/secure_context_learn.dart';
import 'cache/shared_learn_cache.dart';
import 'cache/shared_list_cache.dart';
import 'form_learn_view.dart';
import 'image_learn_202.dart';
import 'oop_learn_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: LightTheme().theme,
      // theme: ThemeData(
      //   brightness: Brightness.light,
      //   /* light theme settings */
      // ),
      // themeMode: ThemeMode.dark,
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      //   /* dark theme settings */
      // ),
      debugShowCheckedModeBanner: false,
      title: 'Json',
      home: const AlertLearn(),
    );
  }
}

