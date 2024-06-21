// import 'package:equatable/equatable.dart';

// class AuthEntity extends Equatable {
//   final String username;
//   final String password;

//   const AuthEntity({
//     required this.username,
//     required this.password,
//   });

//   @override
//   List<Object?> get props => [username, password];
// }

import 'package:equatable/equatable.dart';
 
class AuthEntity extends Equatable {
  final String? userId;
  final String fName;
  final String lName;
  final String email;
  final String password;
 
  const AuthEntity({
    this.userId,
    required this.fName,
    required this.lName,
    required this.email,
    required this.password,
  });
 
  @override
  List<Object?> get props => [
        userId,
        fName,
        email,
        lName,
        password,
      ];
}