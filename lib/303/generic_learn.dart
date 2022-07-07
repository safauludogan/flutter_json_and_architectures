import 'package:flutter/material.dart';

class UserManagement<T extends AdminUser> {
  final T admin;

  UserManagement(this.admin);

  void sayName(GenericUser user) {
    debugPrint(user.name);
  }

  int calculateMoney(List<GenericUser> users) {
    int sum = 0;
    for (var item in users) {
      sum += item.money;
    }
    int initialValue = admin.role == 1 ? admin.money : 0;

    final sumMoney = users.map((e) => e.money).fold<int>(
        initialValue, (previousValue, element) => previousValue + element);

    //final _money =
    //  users.fold<int>(0, (previousValue, element) => previousValue + element);

    return sumMoney;
  }

  Iterable<SFModel<R>>? showNames<R>(List<GenericUser> users) {
    //Bunu sadece role 1 olanlar görebilecek
    if (R == String) {
      final names =
          users.map((e) => SFModel<R>(e.name.split('').toList().cast<R>()));
      return names;
    }
    return null;
  }
}

class SFModel<T> {
  final String name = 'sf';
  final List<T> items;

  SFModel(this.items);
}

class GenericUser {
  final String name;
  final String id;
  final int money;

  GenericUser(this.name, this.id, this.money);
}

class AdminUser extends GenericUser {
  final int role;
  AdminUser(super.name, super.id, super.money, this.role);
}
