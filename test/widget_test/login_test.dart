// import 'package:blog_app/app/navigator_key/navigator_key.dart';
// import 'package:blog_app/core/failure/failure.dart';
// import 'package:blog_app/features/auth/domain/usecases/auth_usecase.dart';
// import 'package:blog_app/features/auth/presentation/navigator/login_navigator.dart';
// import 'package:blog_app/features/auth/presentation/view/login_view.dart';
// import 'package:blog_app/features/auth/presentation/view_model/auth_view_model.dart';
// import 'package:blog_app/features/auth/presentation/view_model/login_view_model.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// import '../unit_test/auth_test.mocks.dart';

// void main() {
//   late AuthUseCase mockAuthUsecase;

//   setUp(() {
//     mockAuthUsecase = MockAuthUseCase();
//   });

//   testWidgets(
//     'Login with username and password and check whether dashboard opens or not',
//     (tester) async {
//       const correctEmail = 'liban';
//       const correctPassword = 'liban123';

//       when(mockAuthUsecase.loginUser(any, any)).thenAnswer((invocation) {
//         final email = invocation.positionalArguments[0] as String;
//         final password = invocation.positionalArguments[1] as String;
//         return Future.value(
//           email == correctEmail && password == correctPassword
//               ? const Right(true)
//               : Left(Failure(error: 'Invalid')),
//         );
//       });

//       await tester.pumpWidget(
//         ProviderScope(
//           overrides: [
//             authViewModelProvider.overrideWithValue(
//               AuthViewModel(
//                 mockAuthUsecase,
//                 loginViewNavigatorProvider,
//               ),
//             ),
//           ],
//           child: MaterialApp(
//             debugShowCheckedModeBanner: false,
//             navigatorKey: AppNavigator.navigatorKey,
//             home: const LoginView(),
//           ),
//         ),
//       );

//       // Add your test actions and expectations here
//     },
//   );
// }
