import 'package:blog_app/core/common/common_widget/show_my_snackbar.dart';
import 'package:blog_app/features/auth/domain/entity/auth_entity.dart';
import 'package:blog_app/features/auth/domain/usecases/auth_usecase.dart';
import 'package:blog_app/features/auth/presentation/navigator/login_navigator.dart';
import 'package:blog_app/features/auth/presentation/state/auth_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
 
final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel(
      ref.read(authUseCaseProvider), ref.read(loginViewNavigatorProvider));
});
 
class AuthViewModel extends StateNotifier<AuthState> {
  AuthViewModel(this.authUseCase, this.navigator) : super(AuthState.initial());
 
  final AuthUseCase authUseCase;
  final LoginViewNavigator navigator;
 
  void registerUser(AuthEntity auth) async {
    state = state.copyWith(isLoading: true);
    var data = await authUseCase.registerUser(auth);
    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
        showMySnackBar(message: l.error, color: Colors.red);
      },
      (r) {
        state = state.copyWith(isLoading: false);
        showMySnackBar(message: 'Register Success');
      },
    );
  }
 
  void loginUser(String email, String password) async {
    state = state.copyWith(isLoading: true);
    var data = await authUseCase.loginUser(email, password);
    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
        showMySnackBar(message: l.error, color: Colors.red);
      },
      (r) {
        state = state.copyWith(isLoading: false, error: null);
        showMySnackBar(message: 'Login Success');
        openHomeView();
      },
    );
  }
 
  void openHomeView() {
    navigator.openHomeView();
  }
}