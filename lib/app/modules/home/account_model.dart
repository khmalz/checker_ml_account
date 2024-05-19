class Account {
  String? userId;
  String? username;

  Account({this.userId, this.username});

  Account.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userId'] = userId;
    data['username'] = username;
    return data;
  }

  @override
  String toString() => 'Account(userId: $userId, username: $username)';
}
