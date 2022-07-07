import 'package:flutter_json_hardwareandro/303/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  test('User calculate', () {
    final users = [
      GenericUser('sf', '11', 10),
      GenericUser('sf', '11', 10),
      GenericUser('sf', '11', 20),
    ];

    final userManagement = UserManagement(AdminUser("sadmin", '1', 15, 1));
    final result = userManagement.calculateMoney(users);
    final response = userManagement.showNames(users);
    expect(result, 55);
  });
}
