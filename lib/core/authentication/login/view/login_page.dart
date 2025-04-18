import 'package:filme_flix/core/app/home/view/home_page.dart';
import 'package:filme_flix/core/authentication/signup/signup_page.dart';
import 'package:filme_flix/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class LoginData {
  final String email;
  final String password;

  LoginData({
    required this.email,
    required this.password,
  });

  factory LoginData.fromMap(Map<String, dynamic> map) {
    return LoginData(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> sigUpController = {
    'email': TextEditingController(),
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
                style: const TextStyle(
                  color: Color(0xff32A873),
                ),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  prefixIconColor: Color(0xff32A873),
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(
                    color: Color(0xff32A873),
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
                style: const TextStyle(
                  color: Color(0xff32A873),
                ),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  prefixIconColor: const Color(0xff32A873),
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
                  hintStyle: const TextStyle(
                    color: Color(0xff32A873),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              PrimaryButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
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
                    'Haven’t made an account? ',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign Up',
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
  LoginData toLoginData() {
    final map = <String, dynamic>{};
    for (MapEntry e in entries) {
      map.putIfAbsent(e.key, () => e.value.text);
    }
    return LoginData.fromMap(map);
  }
}
