import 'package:blog_app/app/contants/api_endpoint.dart';
import 'package:blog_app/core/failure/failure.dart';
import 'package:blog_app/core/networking/remote/http_service.dart';
import 'package:blog_app/core/shared_prefs/user_shared_preps.dart';
import 'package:blog_app/features/auth/data/model/auth_api_model.dart';
import 'package:blog_app/features/auth/domain/entity/auth_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
 
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>(
  (ref) => AuthRemoteDataSource(
    dio: ref.watch(httpServiceProvider),
    authApiModel: ref.watch(authApiModelProvider),
    userSharedPrefs: ref.watch(userSharedPrefsProvider),
  ),
);
 
class AuthRemoteDataSource {
  final Dio dio;
  final AuthApiModel authApiModel;
  final UserSharedPrefs userSharedPrefs;
 
  AuthRemoteDataSource({
    required this.userSharedPrefs,
    required this.dio,
    required this.authApiModel,
  });
 
  Future<Either<Failure, bool>> registerUser(AuthEntity authEntity) async {
    try {
      Response response = await dio.post(
        ApiEndPoints.registerUser,
        data:{
          "_id": DateTime.now().toString(), "username": authEntity.fName, "lName": authEntity.lName, "email": authEntity.email, "password": authEntity.password

        }
      );
      if (response.statusCode == 201) {
        return const Right(true);
      }
      return Left(
        Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString()),
      );
    } on DioException catch (e) {
      return Left(Failure(error: e.error.toString()));
    }
  }
 
  Future<Either<Failure, bool>> loginUser(
      {required String email, required String password}) async {
    try {
      Response response = await dio.post(ApiEndPoints.loginUser,
          data: {'email': email, 'password': password});
      print("Cant login");

 
      if (response.statusCode == 201) {
        final token = response.data['token'];
        await userSharedPrefs.setUserToken(token);
 
        return const Right(true);
      }
 
      return Left(Failure(
          error: response.data['message'],
          statusCode: response.statusCode.toString()));
    } on DioException catch (e) {
      print("Cant login");
      return Left(Failure(error: e.error.toString()));
    }
  }
}