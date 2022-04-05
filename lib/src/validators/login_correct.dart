import 'package:iq_racer/src/routes/get_login.dart';

loginIsCorrect(email, pass) {
  bool isCorrect = false;
  final registes = getData();

  for (var item in registes) {
    if (item["email"] == email && item["password"] == pass) {
      isCorrect = true;
    }
  }
  return isCorrect;
}
