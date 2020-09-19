class AppUser {
  String userName;
  String userEmail;


  AppUser({
    this.userName,
    this.userEmail,
  });

  AppUser.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    userEmail = json['userEmail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['userEmail'] = this.userEmail;
    return data;
  }
}