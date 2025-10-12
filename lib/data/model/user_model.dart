class UserModel {
  String? id;
  final String name;
  final String email;

  UserModel({this.id, required this.name, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json, String docId) {
    return UserModel(id: docId, name: json['name'], email: json['email']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email};
  }
}
