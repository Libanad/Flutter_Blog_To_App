import 'package:blog_app/features/auth/domain/entity/auth_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
 
part 'auth_api_model.g.dart';
 
final authApiModelProvider =
    Provider<AuthApiModel>((ref) => const AuthApiModel.empty());
 
@JsonSerializable()
class AuthApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String fName;
  final String lName;
  final String email;
  final String password;
 
  const AuthApiModel({
    this.id,
    required this.fName,
    required this.lName,
    required this.email,
    required this.password,
  });
 
  const AuthApiModel.empty()
      : id = '',
        fName = '',
        lName = '',
        email = '',
        password = '';
 
  AuthEntity toEntity() {
    return AuthEntity(
      userId: id,
      fName: fName,
      lName: lName,
      email: email,
      password: password,
    
    );
  }
 
  AuthApiModel fromEntity(AuthEntity entity) {
    return AuthApiModel(
      fName: entity.fName,
      email: entity.email,
      lName: entity.lName,
      password: entity.password,
    );
  }
 
  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);
 
  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);
 
  @override
  List<Object?> get props => [
        id,
        fName,
        lName,
        email,
        password,
      ];
}