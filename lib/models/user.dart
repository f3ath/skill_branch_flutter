import 'package:gallery_app/string_utils.dart';

enum LoginType { email, phone }

class User {
  String email;
  String phone;

  String _lastName;
  String _firstName;
  LoginType _type;

  final friends = <User>[];

  User._({String firstName, String lastName, String phone, String email})
      : _firstName = firstName,
        _lastName = lastName,
        this.email = email,
        this.phone = phone {
    print('User created');
    _type = email != null ? LoginType.email : LoginType.phone;
  }

  factory User({String name, String phone, String email}) {
    if (name?.isEmpty == true) throw Exception('User name is empty');
    if (phone?.isEmpty == true && email?.isEmpty == true) {
      throw Exception('Phone or email is empty');
    }
    return User._(
        firstName: _getFirstName(name),
        lastName: _getLastName(name),
        phone: phone != null ? checkPhone(phone) : '',
        email: email != null ? checkEmail(email) : '');
  }

  static String _getLastName(String userName) => userName.split(' ').last;

  static String _getFirstName(String userName) => userName.split(' ').first;

  static String checkPhone(String phone) {
    final pattern = r'^(?:[+0])?\d{11}';
    phone = (phone ?? '').replaceAll(RegExp(r'[^+\d]'), '');
    if (phone == null || phone.isEmpty) {
      throw Exception('Empty phone number');
    }
    if (!RegExp(pattern).hasMatch(phone)) {
      throw Exception('Invalid phone number');
    }
    return phone;
  }

  static String checkEmail(String email) =>
      RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
              .hasMatch(email)
          ? email
          : throw Exception('Invalid email');

  String get login => _type == LoginType.phone ? phone : email;

  String get name => [_firstName, _lastName.capitalized].join(' ');

  @override
  bool operator ==(Object other) {
    if (other is User) {
      return _firstName == other._firstName &&
          _lastName == other._lastName &&
          (phone == other.phone || email == other.email);
    }
    return false;
  }

  void addFriend(Iterable<User> people) => friends.addAll(people);

  void removeFriend(Iterable<User> people) => friends.remove(people);

  String get userInfo => '''
  name: $name
  email: $email
  firstName: $_firstName
  lastName: $_lastName
  friends: ${friends.toList()}
 ''';

  String toString() => '''
  name: $name
  email: $email
  friends: ${friends.toList()}
 ''';
}
