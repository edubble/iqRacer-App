class User {
  int? id;
  String userName = "";
  String firstname = "";
  String lastname = "";
  String email = "";
  String? password;
  String? registerDate;
  int? idGender;
  int? firstTime;
  String? userImage;

  User(
      this.id,
      this.firstname,
      this.lastname,
      this.email,
      this.password,
      this.registerDate,
      this.idGender,
      this.firstTime,
      this.userName,
      this.userImage);
}
