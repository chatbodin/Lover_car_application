// class UserModel {
//   late final String? uid;
//   late final String? email;

//   UserModel({
//     this.uid,
//     this.email,
//   });

//   UserModel copyWith({
//     String? uid,
//     String? email,
//   }) {
//     return UserModel(
//       uid: uid ?? this.uid,
//       email: email ?? this.email,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'uid': uid,
//       'email': email,
//     };
//   }

//   factory UserModel.fromMap(Map<String, dynamic> map) {
//     return UserModel(
//       uid: map['uid'],
//       email: map['email'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory UserModel.fromJson(String source) =>
//       UserModel.fromMap(json.decode(source));

//   @override
//   String toString() => 'UserModel(uid:$uid, email: $email )';

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is UserModel && other.uid == uid && other.email == email;
//   }

//   @override
//   int get hashCode => uid.hashCode ^ email.hashCode;
// }
////////////////////////////////////////////////////////////////////////////////////////
// class UserModel {
//   String? uid;
//   String? email;

//   UserModel({this.uid, this.email});

//   // receiving data from server
//   factory UserModel.fromMap(map) {
//     return UserModel(
//       uid: map['uid'],
//       email: map['email'],
//     );
//   }

//   // sending data to our server
//   Map<String, dynamic> toMap() {
//     return {
//       'uid': uid,
//       'email': email,
//     };
//   }
// }

class UserModel {
  String uid;
  String email;
  String firstName;
  String secondName;

  UserModel({this.uid, this.email, this.firstName, this.secondName});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
    };
  }
}
