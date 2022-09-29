class UserData {
  final String uid;
  final String name;
  final bool status;

  UserData(this.uid, this.name, this.status);

  Map<String, dynamic> toMap() {
    return {
      'userUID': uid,
      'name': name,
      'status': status,
    };
  }
}
