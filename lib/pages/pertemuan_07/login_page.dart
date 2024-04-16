import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'home_page.dart';

class Pertemuan07 extends StatefulWidget {
  const Pertemuan07({super.key});

  @override
  State<Pertemuan07> createState() => _Pertemuan07State();
}

class _Pertemuan07State extends State<Pertemuan07> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  void signIn() {
    if (emailCtrl.text == "rey@gmail.com" && passwordCtrl.text == "123") {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const HomePage();
      }));
    } else {
      Fluttertoast.showToast(
          msg: "Email / Password Salah",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          'Login Page',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextFormField(
                    controller: emailCtrl,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email)),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextFormField(
                    controller: passwordCtrl,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock)),
                    obscureText: true,
                    obscuringCharacter: '*',
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: ElevatedButton(
                    onPressed: () {
                      signIn();
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
