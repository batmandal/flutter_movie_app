import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      print("successful");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Let's sign you in",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Welcome back.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
                const Text(
                  "You've been missed!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "cannot be empty";
                    }
                    return null;
                  },
                  controller: _phoneCtrl,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelStyle:
                          TextStyle(color: Colors.white.withOpacity(0.2)),
                      label: const Text("phone number"),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white.withOpacity(0.9)),
                          borderRadius: BorderRadius.circular(8))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "cannot be empty";
                    }
                    return null;
                  },
                  controller: _passwordCtrl,
                  style: const TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: InputDecoration(
                      labelStyle:
                          TextStyle(color: Colors.white.withOpacity(0.2)),
                      label: const Text("password"),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white.withOpacity(0.9)),
                          borderRadius: BorderRadius.circular(8))),
                ),
              ],
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _onSubmit,
                child: Text("Sign in"),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                  foregroundColor: WidgetStateProperty.all(Colors.black),
                  fixedSize: WidgetStateProperty.all(
                    const Size(double.infinity, 50),
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
