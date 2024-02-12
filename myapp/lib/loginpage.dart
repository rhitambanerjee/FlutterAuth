import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/main.dart';
import 'package:myapp/signuppage.dart';
import 'package:myapp/uihelper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  login(String email, String password) async {
    if (email == "" || password == "") {
      return UiHelper.CustomAlertBox(context, "Enter required fields");
    } else {
      // ignore: unused_local_variable
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyHomePage("My Home Page", title: "My Home Page")));
              return null;
        });
      } on FirebaseAuthException catch (ex) {
        // ignore: use_build_context_synchronously
        UiHelper.CustomAlertBox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login Page",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(emailController, "Email", Icons.mail, false),
          UiHelper.CustomTextField(
              passwordController, "Password", Icons.password, true),
          const SizedBox(
            height: 30.0,
          ),
          UiHelper.CustomButton(() {
            login(emailController.text.toString(),
                passwordController.text.toString());
          }, "Login"),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account?",
                style: TextStyle(fontSize: 16),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()));
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
