import 'package:flutter/material.dart';
import 'package:login_app/db/db_function.dart';
import 'package:login_app/model/data_model.dart';
import 'package:login_app/screen/screen_home.dart';
import 'package:login_app/screen/screen_login.dart';

class ScreenSignUp extends StatefulWidget {
  const ScreenSignUp({super.key});

  @override
  State<ScreenSignUp> createState() => _ScreenSignUpState();
}

class _ScreenSignUpState extends State<ScreenSignUp> {
  final _userController = TextEditingController();
  final _emaiController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _userController.dispose();
    _emaiController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _userController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Username",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _emaiController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Email",
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Password",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                onAddUser();
              },
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('You have an account? '),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ScreenLogin(),
                    ));
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onAddUser() async {
    final _name = _userController.text;
    final _email = _emaiController.text;
    final _password = _passwordController.text;

    if (_name.isEmpty || _email.isEmpty || _password.isEmpty) {
      return;
    }

    final _user = UserModel(name: _name, email: _email, password: _password);

    addUser(_user);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const ScreenHome(),
    ));
  }
}
