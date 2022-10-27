import 'package:flutter/cupertino.dart';
import 'package:fooderlich/models/user.dart';

class ProfileManager extends ChangeNotifier {
  User get getUser => User(
      firstName: 'Adi',
      lastName: 'Wijaya',
      role: 'Student',
      profileImageUrl: 'assets/profile_pics/person_joe.jpeg',
      points: 100,
      darkMode: _darkMode);

  bool get didSelectUser => _didSelectUser;
  bool get darkMode => _darkMode;

  var _didSelectUser = false;
  var _darkMode = false;

  set darkMode(bool darkMode) {
    _darkMode = darkMode;
    notifyListeners();
  }

  void tapOnProfile(bool selected) {
    _didSelectUser = selected;
    notifyListeners();
  }
}
