import 'package:belajar_flutter/pages/ujian_tengah_semester/auth/login.dart';
import 'package:belajar_flutter/pages/ujian_tengah_semester/alert.dart';
import 'package:belajar_flutter/pages/ujian_tengah_semester/static_data.dart';
import 'package:belajar_flutter/pages/ujian_tengah_semester/home/home.dart';
import 'package:belajar_flutter/pages/ujian_tengah_semester/messages/message.dart';
import 'package:belajar_flutter/pages/ujian_tengah_semester/users/users.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class UjianTengahSemester extends StatefulWidget {
  final StaticData userData;
  final AlertToast alertToast;

  const UjianTengahSemester({
    super.key,
    required this.userData,
    required this.alertToast,
  });

  @override
  State<UjianTengahSemester> createState() => _UjianTengahSemesterState();
}

class _UjianTengahSemesterState extends State<UjianTengahSemester> {
  late StaticData userData;
  late AlertToast alertToast;

  @override
  void initState() {
    super.initState();

    userData = widget.userData;
    alertToast = widget.alertToast;
  }

  @override
  Widget build(BuildContext context) {
    return userData.getLoggedInStatus() ? buildLoggedInUI() : buildLoginPage();
  }

  Widget buildLoggedInUI() {
    return MaterialApp(
      title: 'Persistent Bottom Navigation Bar',
      home: PersistentTabView(
        controller: PersistentTabController(initialIndex: 2),
        tabs: [
          PersistentTabConfig(
            screen: const HomePage(),
            item: ItemConfig(
              icon: const Icon(Icons.home),
              title: "Home",
            ),
          ),
          PersistentTabConfig(
            screen: const MessagePage(),
            item: ItemConfig(
              icon: const Icon(Icons.message),
              title: "Messages",
            ),
          ),
          PersistentTabConfig(
            screen: UserPage(
              userData: userData,
              alertToast: alertToast,
            ),
            item: ItemConfig(
              icon: const Icon(Icons.account_circle_rounded),
              title: "Users",
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) => Style1BottomNavBar(
          navBarConfig: navBarConfig,
          // navBarDecoration: NavBarDecoration(
          //   color: Colors.grey.shade200,
          // ),
        ),
      ),
    );
  }

  Widget buildLoginPage() {
    return LoginPage(
      userData: userData,
      alertToast: AlertToast(),
      onLoginSuccess: (newUserData) {
        setState(() {
          userData = newUserData;
        });
      },
    );
  }
}
