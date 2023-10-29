import 'package:flutter/material.dart';
import 'package:sesilyia/dashboard.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.grey, Colors.black],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(top: 20, bottom: 35),
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                      color: Colors.white),
                )),
            _inputField("Username", usernameController),
            const SizedBox(
              height: 20,
            ),
            _inputField("Password", passwordController, isPassword: true),
            const SizedBox(
              height: 50,
            ),
            _loginBtn(context),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {isPassword = false}) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Colors.white),
    );

    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }

  Widget _loginBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        );
      },
      child: const SizedBox(
        width: double.infinity,
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style:
              TextStyle(fontSize: 20, color: Color.fromARGB(255, 70, 70, 70)),
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }
}
