import 'package:flutter/material.dart';
import 'package:flutter_json_hardwareandro/303/product/widget/button/answer_button.dart';
import 'package:flutter_json_hardwareandro/303/product/widget/button/loading_button.dart';
import 'package:flutter_json_hardwareandro/303/product/widget/callback_dropdown.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({Key? key}) : super(key: key);

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CallBackDropdown(onUserSelected: (CallbackUser user) {
            debugPrint(user.name.toString());
          }),
          AnswerButton(
            onNumber: ((number) {
              return number % 3 == 1;
            }),
          ),
          Center(
            child: LoadingButton(title: 'A',onPressed: () async{
              await Future.delayed(const Duration(seconds: 1));
            },),
          ),
        ],
      ),
    );
  }
}

class CallbackUser {
  final String name;
  final int id;

  CallbackUser(this.name, this.id);

  // TODO: Dummy Remove it
  static List<CallbackUser> dummyUsers() {
    return [
      CallbackUser("sf", 123),
      CallbackUser("sf2", 1234),
    ];
  }

  @override
  bool operator ==(Object other) {
    return other is CallbackUser && other.name == name && other.id == id;
  }
}
