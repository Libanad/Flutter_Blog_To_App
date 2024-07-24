
// // import 'package:blog_app/app/screens/dashboard_screen.dart';
// // import 'package:blog_app/app/screens/forgotPasswordScreen.dart';
// // import 'package:blog_app/app/screens/register_scrreen.dart';
// // import 'package:flutter/material.dart';

// // class LoginScreen extends StatelessWidget {
// //   const LoginScreen({super.key,});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(),
// //       body: SingleChildScrollView(
// //         child: Padding(
// //           padding: const EdgeInsets.all(20.0),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               const Padding(
// //                 padding: EdgeInsets.all(20.0),
// //                 child: Text(
// //                   'Hello, Sign In Now',
// //                   style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
// //                 ),
// //               ),
// //               const SizedBox(height: 20),
// //               const LoginForm(),
// //               const SizedBox(height: 20),
// //               Align(
// //                 alignment: Alignment.centerRight,
// //                 child: TextButton(
// //                   onPressed: () {
// //                     // Handle Forgot Password
// //                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()));
// //                   },
                  
// //                   child: const Text(
// //                     'Forgot Password?',
// //                     style: TextStyle(color: Colors.blue),
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(height: 20),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   const Text(
// //                     'New here? ',
// //                     style: TextStyle(color: Colors.black),
// //                   ),
// //                   TextButton(
// //                     onPressed: () {
// //                       // Handle Registration
// //                       // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterScreen(),));
// //                       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const RegisterScreen(),), (route) => false);
// //                     },
// //                     child: const Text(
// //                       'Register',
// //                       style: TextStyle(color: Colors.blue),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class LoginForm extends StatefulWidget {
// //   const LoginForm({super.key});

// //   @override
// //   _LoginFormState createState() => _LoginFormState();
// // }

// // class _LoginFormState extends State<LoginForm> {
// //   final TextEditingController _emailController = TextEditingController();
// //   final TextEditingController _passwordController = TextEditingController();
// //   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

// //   Future<void> _login() async {
// //     if (_formKey.currentState!.validate()) {
// //       final String email = _emailController.text.trim();
// //       final String password = _passwordController.text.trim();

// //       // Perform login logic
// //       // await Future.delayed(const Duration(seconds: 2));
// // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DashboardScreen(),));

// //     //  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => BlogDashboard(),), (route) => false);
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Form(
// //       key: _formKey,
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         crossAxisAlignment: CrossAxisAlignment.center,
// //         children: [
// //           TextFormField(
            
// //             controller: _emailController,
// //             decoration: InputDecoration(
// //               labelText: 'Email',
// //               prefixIcon: const Icon(Icons.person),
// //               border: OutlineInputBorder(
// //                 borderRadius: BorderRadius.circular(20),
// //               ),
// //             ),
// //             validator: (value) {
// //               if (value!.isEmpty) {
// //                 return 'Please enter your email';
// //               } else if (!value.contains('@')) {
// //                 return 'Please enter a valid email';
// //               }
// //               return null;
// //             },
// //           ),
// //           const SizedBox(height: 20),
// //           TextFormField(
// //             controller: _passwordController,
// //             decoration: InputDecoration(
// //               labelText: 'Password',
// //               prefixIcon: const Icon(Icons.lock),
// //               border: OutlineInputBorder(
// //                 borderRadius: BorderRadius.circular(20),
// //               ),
// //             ),
// //             obscureText: true,
// //             validator: (value) {
// //               if (value!.isEmpty) {
// //                 return 'Please enter your password';
// //               }
// //               return null;
// //             },
// //           ),
// //           const SizedBox(height: 20),
// //           ElevatedButton(
// //             onPressed: _login,
// //             style: ElevatedButton.styleFrom(
// //               padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
// //               backgroundColor: Colors.blue,
// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(20),
// //               ),
// //             ),
// //             child: const Text(
// //               'Login',
// //               style: TextStyle(
// //                 fontSize: 18,
// //                 fontWeight: FontWeight.bold,
// //                 color: Colors.white
                
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }


// import 'package:blog_app/features/auth/presentation/view/register_view.dart';
// import 'package:blog_app/features/home/presentation/view/home_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class LoginView extends ConsumerStatefulWidget {
//   const LoginView({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
// }

// class _LoginViewState extends ConsumerState<LoginView> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool rememberPassword = true;

//   Future<void> _login(BuildContext context) async {
//     if (_formKey.currentState!.validate()) {
//       final String email = _emailController.text.trim();
//       final String password = _passwordController.text.trim();

//       // Perform login logic
//       Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeView()));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               flex: 7,
//               child: SingleChildScrollView(
//                 child: Container(
//                   padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(40.0),
//                       topRight: Radius.circular(40.0),
//                     ),
//                   ),
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         const Padding(
//                           padding: EdgeInsets.all(20.0),
//                           child: Text(
//                             'Hello, Sign In Now',
//                             style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         TextFormField(
//                           controller: _emailController,
//                           decoration: InputDecoration(
//                             label: const Text('Email'),
//                             hintText: 'Enter Email',
//                             prefixIcon: const Icon(Icons.email),
//                             border: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.black12),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.black12),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter your email';
//                             } else if (!value.contains('@')) {
//                               return 'Please enter a valid email';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 25.0),
//                         TextFormField(
//                           controller: _passwordController,
//                           obscureText: true,
//                           obscuringCharacter: '*',
//                           decoration: InputDecoration(
//                             label: const Text('Password'),
//                             hintText: 'Enter Password',
//                             prefixIcon: const Icon(Icons.lock),
//                             border: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.black12),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.black12),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter your password';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 25.0),
//                         Align(
//                           alignment: Alignment.centerRight,
//                           child: TextButton(
//                             onPressed: () {
//                               // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()));
//                             },
//                             child: const Text(
//                               'Forgot Password?',
//                               style: TextStyle(color: Colors.blue),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 25.0),
//                         SizedBox(
//                           width: double.infinity,
//                           child: ElevatedButton(
//                             onPressed: () => _login(context),
//                             style: ElevatedButton.styleFrom(
//                               padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                               backgroundColor: Colors.blue,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                             ),
//                             child: const Text(
//                               'Login',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Text('New here? ', style: TextStyle(color: Colors.black)),
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.of(context).pushAndRemoveUntil(
//                                   MaterialPageRoute(builder: (context) => const SignupView()),
//                                   (route) => false,
//                                 );
//                               },
//                               child: const Text(
//                                 'Register',
//                                 style: TextStyle(color: Colors.blue),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:blog_app/app/screens/forgotPasswordScreen.dart';
import 'package:blog_app/features/auth/presentation/view_model/auth_view_model.dart';
import 'package:blog_app/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:blog_app/features/auth/presentation/navigator/login_navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';
Future<void> saveUserData(String username, String email) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('username', username);
  await prefs.setString('email', email);
  // You can save other data similarly
}


class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _formSignInKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool rememberPassword = false;

Future<void> _login() async {
  if (_formSignInKey.currentState!.validate()) {
    // Trigger the login action in AuthViewModel
    final authViewModel = ref.read(authViewModelProvider.notifier);
    authViewModel.loginUser(
      _emailController.text,
      _passwordController.text,
    );
    

    // After login attempt, get the updated state
    final authState = ref.watch(authViewModelProvider);

    if (authState.error == null) {
      // Navigate to home or any other screen on successful login
       final prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', _emailController.text);
      ref.read(loginViewNavigatorProvider).openHomeView();
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logged In')),
      );
      Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeView(),
                  ),
                );
    } else {
      // Show error message on failed login
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text(authState.error ?? 'Login failed')),
      // );
    }
  }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: Form(
                    key: _formSignInKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/blog.jpeg',
                          height: 200,
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Email';
                            }
                            if (!value.contains('@')) {
                              return 'Please enter a valid Email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: 'Enter Email',
                            prefixIcon: const Icon(Icons.email),
                            hintStyle: const TextStyle(color: Colors.black26),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25.0),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          obscuringCharacter: '*',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter Password',
                            prefixIcon: const Icon(Icons.lock),
                            hintStyle: const TextStyle(color: Colors.black26),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: rememberPassword,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      rememberPassword = value ?? false;
                                    });
                                  },
                                  focusColor: Colors.black,
                                ),
                                const Text(
                                  'Remember me',
                                  style: TextStyle(color: Colors.black45),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                // Handle forgot password logic here
                                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotPasswordScreen(),
                  ),
                );
                              
                              },
                              child: const Text(
                                'Forget password?',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25.0),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _login,
                            child: const Text('Login'),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account? ',
                              style: TextStyle(color: Colors.black45),
                            ),
                            GestureDetector(
                              onTap: () {
                                ref.read(loginViewNavigatorProvider).openRegisterView();
                              },
                              child: const Text(
                                'Sign up',
                                style: TextStyle(
                                  fontFamily: 'EduTASBeginner Bold',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 0.7,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'Continue with',
                                style: TextStyle(color: Colors.black45),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 0.7,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25.0),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.facebook,
                                  color: Colors.blue,
                                ),
                                Text('Facebook'),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.mail,
                                  color: Colors.pink,
                                ),
                                Text('Mail'),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.apple,
                                  color: Colors.black,
                                ),
                                Text('Apple'),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 25.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
