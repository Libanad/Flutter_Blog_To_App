import 'package:blog_app/app/navigator/navigator.dart';
import 'package:blog_app/features/auth/presentation/navigator/login_navigator.dart';
import 'package:blog_app/features/auth/presentation/view/register_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
 
final registerViewNavigatorProvider =
    Provider((ref) => RegisterViewNavigator());
 
class RegisterViewNavigator with LoginViewRoute {}
 
// Anyone who want to call register view
mixin RegisterViewRoute {
  openRegisterView() {
    NavigateRoute.pushRoute(const SignupView());
  }
}