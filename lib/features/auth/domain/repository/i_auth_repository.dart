
import 'package:blog_app/core/failure/failure.dart';
import 'package:blog_app/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:blog_app/features/auth/data/repository/auth_local_repository.dart';
import 'package:blog_app/features/auth/domain/entity/auth_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
 
final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  return AuthLocalRepository(
      authLocalDataSource: ref.read(authLocalDataSourceProvider));
});
 
abstract class IAuthRepository {
  Future<Either<Failure, bool>> registerUser(AuthEntity user);
  Future<Either<Failure, bool>> loginUser(String email, String password);
}
 