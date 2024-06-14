
// import 'package:blog_app/app/screens/login_screen.dart';
// import 'package:flutter/material.dart';

// class RegisterScreen extends StatelessWidget {
//   const RegisterScreen({super.key,});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Padding(
//                 padding: EdgeInsets.all(20.0),
//                 child: Text(
//                   'Create an Account',
//                   style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               const RegisterForm(),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Already have an account? ',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       // Navigate to LoginScreen
//                       // Navigator.pushReplacementNamed(context, '/login');
//                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen(),));
//                     },
//                     child: const Text(
//                       'Login',
//                       style: TextStyle(color: Colors.blue),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class RegisterForm extends StatefulWidget {
//   const RegisterForm({super.key});

//   @override
//   _RegisterFormState createState() => _RegisterFormState();
// }

// class _RegisterFormState extends State<RegisterForm> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _lastNameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();

//   String? _validateFirstName(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter your first name';
//     }
//     return null;
//   }

//   String? _validateLastName(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter your last name';
//     }
//     return null;
//   }

//   String? _validateEmail(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter an email address';
//     }
//     if (!value.contains('@')) {
//       return 'Please enter a valid email address';
//     }
//     return null;
//   }

//   String? _validatePassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter a password';
//     }
//     return null;
//   }

//   String? _validateConfirmPassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please confirm your password';
//     }
//     if (value != _passwordController.text) {
//       return 'Passwords do not match';
//     }
//     return null;
//   }

//   Future<void> _register() async {
//     if (_formKey.currentState!.validate()) {
//       // Perform registration logic
//       final String firstName = _firstNameController.text.trim();
//       final String lastName = _lastNameController.text.trim();
//       final String email = _emailController.text.trim();
//       final String password = _passwordController.text.trim();
//       final String confirmPassword = _confirmPasswordController.text.trim();

//       // Perform registration logic
//       // ...

//       // Navigate to home screen after successful registration
//       Navigator.pushReplacementNamed(context, '/home');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           TextFormField(
//             controller: _firstNameController,
//             validator: _validateFirstName,
//             decoration: InputDecoration(
//               labelText: 'First Name',
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           TextFormField(
//             controller: _lastNameController,
//             validator: _validateLastName,
//             decoration: InputDecoration(
//               labelText: 'Last Name',
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           TextFormField(
//             controller: _emailController,
//             validator: _validateEmail,
//             decoration: InputDecoration(
//               labelText: 'Email',
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           TextFormField(
//             controller: _passwordController,
//             validator: _validatePassword,
//             decoration: InputDecoration(
//               labelText: 'Password',
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//             ),
//             obscureText: true,
//           ),
//           const SizedBox(height: 20),
//           TextFormField(
//             controller: _confirmPasswordController,
//             validator: _validateConfirmPassword,
//             decoration: InputDecoration(
//               labelText: 'Confirm Password',
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//             ),
//             obscureText: true,
//           ),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: _register,
//             style: ElevatedButton.styleFrom(
//               padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//               backgroundColor: Colors.blue,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//             ),
//             child: const Text(
//               'Register',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:blog_app/features/auth/domain/entity/auth_entity.dart';
// import 'package:blog_app/features/auth/presentation/view_model/auth_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:blog_app/features/auth/presentation/navigator/signup_navigator.dart';


// class SignupView extends ConsumerStatefulWidget {
//   const SignupView({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _SignupViewState();
// }

// class _SignupViewState extends ConsumerState<SignupView> {
//   final _formKey = GlobalKey<FormState>();

//   final fNameController = TextEditingController();
//   final lNameController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();

//   String? _validateName(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter your name';
//     }
//     return null;
//   }

//   String? _validateEmail(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter an email address';
//     }
//     if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value)) {
//       return 'Please enter a valid email address';
//     }
//     return null;
//   }

//   String? _validatePassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter a password';
//     }
//     if (value.length < 6) {
//       return 'Password must be at least 6 characters';
//     }
//     return null;
//   }

//   String? _validateConfirmPassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please confirm your password';
//     }
//     if (value != passwordController.text) {
//       return 'Passwords do not match';
//     }
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final authState = ref.watch(authViewModelProvider);
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 80),
//                 const Text(
//                   'Create an Account',
//                   style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 40),
//                 TextFormField(
//                   controller: fNameController,
//                   validator: _validateName,
//                   decoration: const InputDecoration(
//                     labelText: 'First Name',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 TextFormField(
//                   controller: lNameController,
//                   validator: _validateName,
//                   decoration: const InputDecoration(
//                     labelText: 'Last Name',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 TextFormField(
//                   controller: emailController,
//                   validator: _validateEmail,
//                   decoration: const InputDecoration(
//                     labelText: 'Email',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 TextFormField(
//                   controller: passwordController,
//                   validator: _validatePassword,
//                   decoration: const InputDecoration(
//                     labelText: 'Password',
//                     border: OutlineInputBorder(),
//                   ),
//                   obscureText: true,
//                 ),
//                 const SizedBox(height: 20),
//                 TextFormField(
//                   controller: confirmPasswordController,
//                   validator: _validateConfirmPassword,
//                   decoration: const InputDecoration(
//                     labelText: 'Confirm Password',
//                     border: OutlineInputBorder(),
//                   ),
//                   obscureText: true,
//                 ),
//                 const SizedBox(height: 30),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       AuthEntity auth = AuthEntity(
//                         fName: fNameController.text,
//                         lName: lNameController.text,
//                         email: emailController.text,
//                         password: passwordController.text,
//                       );
//                       ref.read(authViewModelProvider.notifier).registerUser(auth);
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: const Size(double.infinity, 50),
//                     backgroundColor: Colors.blue,
//                   ),
//                   child: const Text(
//                     'Register',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 TextButton(
//                   onPressed: () {
//                     ref.read(registerViewNavigatorProvider).openLoginView();
//                   },
//                   child: const Text('Already have an account? Login Now'),
//                 ),
//                 const SizedBox(height: 20),
//                 if (authState.isLoading) const CircularProgressIndicator(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:blog_app/features/auth/domain/entity/auth_entity.dart';
import 'package:blog_app/features/auth/presentation/navigator/signup_navigator.dart';
import 'package:blog_app/features/auth/presentation/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
 
class SignupView extends ConsumerStatefulWidget {
  const SignupView({super.key});
 
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupViewState();
}
 
class _SignupViewState extends ConsumerState<SignupView> {
  final _formKey = GlobalKey<FormState>();
 
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
 
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                const Image(
                  image: AssetImage('assets/images/blog.jpeg'),
                  height: 200,
                ),
                const Text('BLOG APP',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 40),
                TextFormField(
                  controller: fNameController,
                  decoration: const InputDecoration(
                      labelText: 'First Name', border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your First Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: lNameController,
                  decoration: const InputDecoration(
                      labelText: 'Last Name', border: OutlineInputBorder()),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Last Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      labelText: 'Email', border: OutlineInputBorder()),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                      labelText: 'Password', border: OutlineInputBorder()),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: confirmPasswordController,
                  decoration: const InputDecoration(
                      labelText: 'Confirm password',
                      border: OutlineInputBorder()),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      AuthEntity auth = AuthEntity(
                        fName: fNameController.text,
                        lName: lNameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      ref
                          .read(authViewModelProvider.notifier)
                          .registerUser(auth);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: Colors.black,
                  ),
                  child: const Text('Register',
                      style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    ref.read(registerViewNavigatorProvider).openLoginView();
                  },
                  child: const Text('Already have an account? Login Now'),
                ),
                const SizedBox(height: 20),
                if (authState.isLoading) const CircularProgressIndicator()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
