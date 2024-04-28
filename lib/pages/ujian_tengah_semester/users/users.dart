import 'package:belajar_flutter/pages/ujian_tengah_semester/alert.dart';
import 'package:belajar_flutter/pages/ujian_tengah_semester/main.dart';
import 'package:belajar_flutter/pages/ujian_tengah_semester/static_data.dart';
import 'package:belajar_flutter/pages/ujian_tengah_semester/users/user_profile.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  final StaticData userData;
  final AlertToast alertToast;

  const UserPage({
    super.key,
    required this.userData,
    required this.alertToast,
  });

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade500,
        title: const Text(
          'User',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            fontFamily: "Roboto",
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          Card(
            color: Colors.grey.shade50,
            shadowColor: Colors.blue.shade300,
            elevation: 5,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(
                      userData: userData,
                      alertToast: alertToast,
                      onUserDataChanged: (newUserData) {
                        setState(() {
                          userData = newUserData;
                        });
                      },
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 38.5,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 37,
                        backgroundImage: AssetImage("assets/images/default/profile.png"),
                        foregroundImage: AssetImage("assets/images/profile/1731.jpg"),
                        backgroundColor: Color.fromARGB(255, 179, 179, 176),
                      ),
                    ),
                    const SizedBox(width: 23),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            userData.profileName,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            softWrap: true,
                            style: const TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            userData.phoneNumber,
                            style: const TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Card(
            color: Colors.grey.shade50,
            shadowColor: Colors.blue.shade300,
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: const Icon(Icons.key),
                  title: const Text('Account'),
                  onTap: () {
                    alertToast.commingSoon();
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.color_lens),
                  title: const Text('Theme'),
                  onTap: () {
                    alertToast.commingSoon();
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.notifications),
                  title: const Text('Notification'),
                  onTap: () {
                    alertToast.commingSoon();
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.storage),
                  title: const Text('Storage'),
                  onTap: () {
                    alertToast.commingSoon();
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.language),
                  title: const Text('Language'),
                  onTap: () {
                    alertToast.commingSoon();
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.privacy_tip),
                  title: const Text('Privacy'),
                  onTap: () {
                    alertToast.commingSoon();
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () {
                    userData.changeLoggedInStatus(false);

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return UjianTengahSemester(
                          userData: userData,
                          alertToast: alertToast,
                        );
                      }),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.more_horiz),
                  title: const Text('Lainnya'),
                  onTap: () {
                    alertToast.commingSoon();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
