import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:demoapi/dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> _login(BuildContext context) async {
    // Check if email and password controllers are not empty
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      // API endpoint URL
      var url = Uri.parse('https://www.demo.odofortius.in/rest_api/users_login');

      // Request body
      var body = {
        'users_email': emailController.text,
        'password': passwordController.text,
      };

      // API call
      var response = await http.post(
        url,
        body: body,
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        if (jsonResponse is Map<String, dynamic>) {
          if (jsonResponse.containsKey('status') && jsonResponse['status'] == 'success') {
            // Navigate to Dashboard screen on successful login
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Dashboard()),
            );
            return;
          } else if (jsonResponse.containsKey('message')) {
            // Handle login failure (display error message, etc.)
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Login Failed'),
                  content: Text(jsonResponse['message'].toString()), // Convert to string
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
            return;
          }
        }
      } else {
        // Handle API request failure
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Failed to connect to the server.'),
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
    } else {
      // Handle empty values in text controllers
      if (emailController.text.isEmpty) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Please enter your email.'),
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
      } else if (passwordController.text.isEmpty) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Please enter your password.'),
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
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _login(context); // Pass the context to _login method
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
