import 'package:blog_app/core/failure/failure.dart';
import 'package:blog_app/features/auth/domain/entity/auth_entity.dart';
import 'package:blog_app/features/auth/domain/repository/i_auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
 
final authUseCaseProvider = Provider((ref) {
  return AuthUseCase(authRepository: ref.watch(authRepositoryProvider));
});
 
class AuthUseCase {
  final IAuthRepository authRepository;
 
  AuthUseCase({required this.authRepository});
 
  Future<Either<Failure, bool>> registerUser(AuthEntity auth) {
    return authRepository.registerUser(auth);
  }
 
  Future<Either<Failure, bool>> loginUser(String? email, String? password) {
    return authRepository.loginUser(email ?? '', password ?? '');
  }

 
}