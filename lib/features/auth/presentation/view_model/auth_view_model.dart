import 'package:blog_app/core/common/common_widget/show_my_snackbar.dart';
import 'package:blog_app/features/auth/domain/entity/auth_entity.dart';
import 'package:blog_app/features/auth/domain/usecases/auth_usecase.dart';
import 'package:blog_app/features/auth/presentation/navigator/login_navigator.dart';
import 'package:blog_app/features/auth/presentation/state/auth_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
 
final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel(
    ref.read(authUseCaseProvider),
    ref.read(loginViewNavigatorProvider),
  );
});

 class AuthViewModel extends StateNotifier<AuthState> {
  AuthViewModel(this.authUseCase, this.navigator) : super(AuthState.initial());

  final AuthUseCase authUseCase;
  final LoginViewNavigator navigator;
  

  Future<void> registerUser(AuthEntity auth) async {
    state = state.copyWith(isLoading: true);
    final result = await authUseCase.registerUser(auth);

    result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.error);
        showMySnackBar(message: failure.error, color: Colors.red);
      },
      (success) {
        state = state.copyWith(isLoading: false);
        showMySnackBar(message: 'Register Success');
      },
    );
  }

Future<void> loginUser(String email, String password) async {
  state = state.copyWith(isLoading: true);

  final result = await authUseCase.loginUser(email, password);

  result.fold(
    (failure) {
      state = state.copyWith(isLoading: false, error: failure.error);
      // showMySnackBar(message: failure.error, color: Colors.red);
    },
    (success) async {
      state = state.copyWith(isLoading: false, error: null);
      showMySnackBar(message: 'Login Success');

      // Save user data to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', email);
      // Save other user data if available

      navigator.openHomeView();
    },
  );
}


  void openHomeView() {
    navigator.openHomeView();
  }
}
