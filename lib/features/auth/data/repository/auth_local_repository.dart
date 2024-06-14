import 'package:blog_app/core/failure/failure.dart';
import 'package:blog_app/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:blog_app/features/auth/domain/entity/auth_entity.dart';
import 'package:blog_app/features/auth/domain/repository/i_auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
 
final authLocalRepositoryProvider = Provider<IAuthRepository>((ref) {
  return AuthLocalRepository(
      authLocalDataSource: ref.read(authLocalDataSourceProvider));
});
 
class AuthLocalRepository implements IAuthRepository {
  final AuthLocalDataSource authLocalDataSource;
 
  AuthLocalRepository({required this.authLocalDataSource});
 
  @override
  Future<Either<Failure, bool>> registerUser(AuthEntity user) {
    return authLocalDataSource.registerUser(user);
  }
 
  @override
  Future<Either<Failure, bool>> loginUser(String email, String password) {
    return authLocalDataSource.loginUser(email, password);
  }
}