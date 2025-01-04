import 'package:mega_store/DB/database.dart';

class Validator {
  static bool isUniqueEmail(String email) {
    return !Database.users.any((userModel) => userModel.email == email);
  }

  static bool isUserExists(String email) {
    return Database.users.any((userModel) => userModel.email == email);
  }

  static bool isCorrectPassword(String password, String email) {
    return Database.users.any(
      (userModel) => userModel.email == email && userModel.password == password,
    );
  }
}
