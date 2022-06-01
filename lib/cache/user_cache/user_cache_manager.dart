import 'dart:convert';

import 'package:flutter_json_hardwareandro/cache/shared_manager.dart';

import '../user_model.dart';

class UserCacheManger {
  final SharedManager sharedManager;

  UserCacheManger(this.sharedManager);

  Future<void> saveItems(List<User> items) async {
    final _items =
        items.map((element) => jsonEncode(element.toJson())).toList();
    await sharedManager.saveStringItems(SharedKeys.users, _items);
  }

  List<User>? getItems() {
    final itemsString = sharedManager.getStrings(SharedKeys.users);
    if (itemsString?.isNotEmpty ?? false) {
      return itemsString!.map((element) {
        final json = jsonDecode(element);

        if (json is Map<String, dynamic>) {
          return User.fromJson(json);
        }

        return User('', '', '');
      }).toList();
    }
    return null;
  }
}
