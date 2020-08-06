import '../string_util.dart';

enum LoginType { email, phone }

class User with UserUtils {

  factory User({String name, String phone, String email}) {
    if (name?.isEmpty == true) throw Exception('User name is empty');
    if (phone?.isEmpty == true && email?.isEmpty == true) {
      throw Exception('Phone or email is empty');
    }
    return User._(
        firstName: name.split(' ').first,
        lastName: name.split(' ').last,
        phone: phone != null ? checkPhone(phone) : '',
        email: email != null ? checkEmail(email) : '');
  }

  User._({String firstName, String lastName, String phone, String email})
      : _firstName = firstName,
        _lastName = lastName,
        this.email = email,
        this.phone = phone,
        _type = email != null ? LoginType.email : LoginType.phone {
    print('User created');
  }

  static String checkPhone(String phone) {
    final plusAndDigits = phone.replaceAll(RegExp(r'[^+\d]'), '');
    if (!RegExp(r'^(?:[+0])?\d{11}').hasMatch(plusAndDigits)) {
      throw Exception('Invalid phone number');
    }
    return plusAndDigits;
  }

  static String checkEmail(String email) =>
      RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
              .hasMatch(email)
          ? email
          : throw Exception('Invalid email');

  final String email;
  final String phone;
  final friends = <User>[];

  final String _lastName;
  final String _firstName;
  final LoginType _type;

  String get login => _type == LoginType.phone ? phone : email;

  String get name =>
      [_firstName, _lastName].map((_) => _.capitalized).join(' ');

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

  String toString() => '''
  name: $name
  email: $email
  friends: ${friends.toList()}
 ''';
}

mixin UserUtils {
  String capitalize(String s) => s.capitalized;
}
