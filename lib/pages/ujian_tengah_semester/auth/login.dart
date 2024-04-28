import 'package:belajar_flutter/pages/ujian_tengah_semester/alert.dart';
import 'package:belajar_flutter/pages/ujian_tengah_semester/main.dart';
import 'package:belajar_flutter/pages/ujian_tengah_semester/static_data.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final StaticData userData;
  final AlertToast alertToast;
  final Function(StaticData) onLoginSuccess;

  const LoginPage({
    super.key,
    required this.userData,
    required this.alertToast,
    required this.onLoginSuccess,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late StaticData userData;
  late AlertToast alertToast;

  @override
  void initState() {
    userData = widget.userData;
    alertToast = widget.alertToast;

    super.initState();
  }

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.blue.shade700,
                Colors.blue.shade400,
                Colors.blue.shade300,
                Colors.blue.shade500,
                Colors.blue.shade700
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 70),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Welcome Back",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 35),
                      _buildInputField(
                        controller: phoneNumberController,
                        labelText: 'Phone Number',
                        prefixIcon: Icons.phone,
                      ),
                      const SizedBox(height: 20),
                      _buildInputField(
                        controller: passwordController,
                        labelText: 'Password',
                        prefixIcon: Icons.lock,
                        obscureText: true,
                      ),
                      const SizedBox(height: 50),
                      ElevatedButton(
                        onPressed: _isLoading ? null : _login,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 16),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue[500],
                        ),
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.black,
                                backgroundColor: Colors.blue,
                              )
                            : const Text(
                                'Login',
                                style: TextStyle(fontSize: 16),
                              ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          // TODO: FORGOT PASSWORD DISINI BANG AYO IMPLEMENT
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String labelText,
    IconData? prefixIcon,
    bool obscureText = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
        ),
      ),
    );
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (phoneNumberController.text == userData.getPhoneNumber() && passwordController.text == userData.getPassword()) {
      userData.changeLoggedInStatus(true);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return UjianTengahSemester(
            userData: userData,
            alertToast: alertToast,
          );
        }),
      );

      alertToast.custom("Login Success");
    } else {
      alertToast.custom("Invalid phone number or password");
    }

    setState(() {
      _isLoading = false;
    });
  }
}
