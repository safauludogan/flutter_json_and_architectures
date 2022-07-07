import 'package:flutter/material.dart';

import '../../callback_learn.dart';

class CallBackDropdown extends StatefulWidget {
  const CallBackDropdown({Key? key, required this.onUserSelected}) : super(key: key);

  final void Function(CallbackUser) onUserSelected;

  @override
  State<CallBackDropdown> createState() => _CallBackDropdownState();
}

class _CallBackDropdownState extends State<CallBackDropdown> {
  CallbackUser? _user;

  void _updateUser(CallbackUser? item){
    setState((){
      _user = item;
    });
    if(_user!=null){
      widget.onUserSelected.call(_user!);
    }
  }
  @override
  Widget build(BuildContext context) {
    return  DropdownButton<CallbackUser>(
      value: _user,
      items: CallbackUser.dummyUsers().map((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(
            e.name,
            style: Theme.of(context).textTheme.headline3,
          ),
        );
      }).toList(),
      onChanged: _updateUser,
    );
  }
}
