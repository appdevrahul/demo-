

import 'package:demoapi/api.dart';
import 'package:demoapi/dashboard.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool showButton = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String username = '';
  String password = '';

  userLogin(context) async {
    Map res = await HttpService().postWithBody('/rest_api/users_login',
        {"users_email": username.toString(), "password": password.toString()});
    if (res["data"]["Status"] == "Success") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Dashboard()));
      _showAlertDialog(context, 'Error', 'Login failed. Please try again.');
    }
  }

  void _showAlertDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Login')),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 370,
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) {
                    username = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: 370,
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) {
                    password = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: 290,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: showButton
                      ? () {}
                      : () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        showButton = true;
                      });
                      userLogin(context);
                    }
                  },
                  child: showButton
                      ? const SizedBox(
                    height: 15,
                    width: 15,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                      : const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Text(message), // Display login message
            ],
          ),
        ),
      ),
    );
  }
}
