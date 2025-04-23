import 'package:filme_flix/core/authentication/login/view/login_page.dart';
import 'package:filme_flix/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class LoginData {
  final String email;
  final String username;
  final String password;

  LoginData({
    required this.email,
    required this.username,
    required this.password,
  });

  factory LoginData.fromMap(Map<String, dynamic> map) {
    return LoginData(
      email: map['email'] ?? '',
      username: map['username'] ?? '',
      password: map['password'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'username': username,
      'password': password,
    };
  }
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> sigUpController = {
    'email': TextEditingController(),
    'username': TextEditingController(),
    'password': TextEditingController(),
  };
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
          child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 64),
              TextFormField(
                controller: sigUpController['email'],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  prefixIconColor: Theme.of(context).colorScheme.primary,
                  border: const OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              TextFormField(
                controller: sigUpController['username'],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid usarname';
                  }
                  return null;
                },
                keyboardType: TextInputType.name,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  prefixIconColor: Theme.of(context).colorScheme.primary,
                  border: const OutlineInputBorder(),
                  labelText: 'Username',
                  hintText: 'Enter your username',
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              TextFormField(
                obscureText: _isObscure,
                controller: sigUpController['password'],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid password';
                  }
                  return null;
                },
                keyboardType: TextInputType.visiblePassword,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  prefixIconColor: Theme.of(context).colorScheme.primary,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                  border: const OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              PrimaryButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final data = sigUpController.data();
                    print(data.email);
                    print(data.password);
                  }
                },
                text: "Login",
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Color(0xFF95ACFF),
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}

extension Data on Map<String, TextEditingController> {
  LoginData data() {
    final map = <String, dynamic>{};
    for (MapEntry e in entries) {
      map.putIfAbsent(e.key, () => e.value.text);
    }
    return LoginData.fromMap(map);
  }
}
