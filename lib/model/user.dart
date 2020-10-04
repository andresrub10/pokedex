class User {
  String id;
  String givenName;
  String email;
  String imageUrl;

  User({
    this.id,
    this.givenName,
    this.email,
    this.imageUrl,
  });

  dynamic toJson() {
    return {
      "id": id.toString(),
      "givenName": givenName,
      "email": email,
      "imageUrl": imageUrl
    };
  }

  User.fromJson(dynamic data) {
    id = data["id"];
    givenName = data["givenName"];
    email = data["email"];
    imageUrl = data["imageUrl"];
  }

  void equalizeWith(User input) {
    id = input.id;
    givenName = input.givenName;
    email = input.email;
    imageUrl = input.imageUrl;
  }
}
