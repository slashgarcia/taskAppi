class Token {
  Token({
    this.type,
    this.token,
    this.refreshToken,
  });

  String type;
  String token;
  dynamic refreshToken;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        type: json["type"],
        token: json["token"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "token": token,
        "refreshToken": refreshToken,
      };
}
