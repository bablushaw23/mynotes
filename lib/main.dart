import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mynotes/firebase_options.dart';

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
            onPressed: () async {
              await Firebase.initializeApp(
                  // u have to initialize firebase instance before using any firebase services
                  options: DefaultFirebaseOptions.currentPlatform);
              final email = _email.text;
              final password = _password.text;
              final userCred = await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: email, password: password);
              print(userCred); // pring in logs
            },
            child: const Text("Register"),
          ),
        ],
      ),
    );
  }
}
