class UserModel {
  String? email;
  String? role;
  String? uid;
  String? name;
  String? mobile;
  String? address;

// receiving data
  UserModel(
      {this.uid, this.email, this.role, this.name, this.mobile, this.address});

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      role: map['role'],
      name: map['name'],
      mobile: map['mobile'],
      address: map['address'],
    );
  }
// sending data
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'role': role,
      'name': name,
      'mobile': mobile,
      'address': address,
    };
  }
}
