
import 'package:blog_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Create an Account',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              const RegisterForm(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to LoginScreen
                      // Navigator.pushReplacementNamed(context, '/login');
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen(),));
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String? _validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your first name';
    }
    return null;
  }

  String? _validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your last name';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      // Perform registration logic
      final String firstName = _firstNameController.text.trim();
      final String lastName = _lastNameController.text.trim();
      final String email = _emailController.text.trim();
      final String password = _passwordController.text.trim();
      final String confirmPassword = _confirmPasswordController.text.trim();

      // Perform registration logic
      // ...

      // Navigate to home screen after successful registration
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: _firstNameController,
            validator: _validateFirstName,
            decoration: InputDecoration(
              labelText: 'First Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _lastNameController,
            validator: _validateLastName,
            decoration: InputDecoration(
              labelText: 'Last Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _emailController,
            validator: _validateEmail,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _passwordController,
            validator: _validatePassword,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _confirmPasswordController,
            validator: _validateConfirmPassword,
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _register,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'Register',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
