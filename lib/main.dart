import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: const HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController
      _email; // late keyword says I dont have a value but promise to assign before use
  late final TextEditingController
      _password; // the textfield value inside appbar body will not be accessible to register button. So, adding central controller

  @override
  void initState() {
    // constructor
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // destructor
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _email,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: "Email"),
          ), // for email
          TextField(
            controller: _password,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
              hintText: "Password",
            ),
          ), // for password
          TextButton(
            onPressed: () => {},
            child: const Text("Register"),
          ),
        ],
      ),
    );
  }
}
