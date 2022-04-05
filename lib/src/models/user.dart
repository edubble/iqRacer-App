class User {
  int? id;
  String userName = "";
  String firstname = "";
  String lastname = "";
  String email = "";
  String? password;
  String? registerDate;
  int? active;
  int? idGender;
  int? idGroup;
  String? userImage;

  User(this.id, this.userName, this.firstname, this.lastname, this.email, this.password, this.registerDate, this.active,
this.idGender, this.idGroup, this.userImage);
}
