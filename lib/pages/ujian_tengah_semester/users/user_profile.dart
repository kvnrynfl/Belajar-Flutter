  import 'package:belajar_flutter/pages/ujian_tengah_semester/alert.dart';
  import 'package:belajar_flutter/pages/ujian_tengah_semester/static_data.dart';
  import 'package:flutter/material.dart';
  import 'package:font_awesome_flutter/font_awesome_flutter.dart';

  class ProfilePage extends StatefulWidget {
    final StaticData userData;
    final AlertToast alertToast;
    final Function(StaticData) onUserDataChanged;

    const ProfilePage({
      super.key,
      required this.userData,
      required this.alertToast,
      required this.onUserDataChanged,
    });

    @override
    State<ProfilePage> createState() => _ProfilePageState();
  }

  class _ProfilePageState extends State<ProfilePage> {
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
          title: const Text('Profile'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    alertToast.commingSoon();
                  },
                  child: const CircleAvatar(
                    radius: 77,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 75,
                      backgroundImage: AssetImage("assets/images/default/profile.png"),
                      foregroundImage: AssetImage("assets/images/profile/1731.jpg"),
                      backgroundColor: Color.fromARGB(255, 179, 179, 176),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildProfileItem(
                title: 'Nama',
                value: userData.profileName,
                onTap: () {
                  _showEditDialog('Nama', userData.profileName, (newValue) {
                    setState(() {
                      userData.changeProfileName(newValue);
                    });
                  });
                },
              ),
              _buildProfileItem(
                title: 'No. Telepon',
                value: userData.phoneNumber,
                onTap: () {
                  _showEditDialog('No. Telepon', userData.phoneNumber, (newValue) {
                    setState(() {
                      userData.changePhoneNumber(newValue);
                    });
                  });
                },
              ),
              _buildProfileItem(
                title: 'Email',
                value: userData.email,
                onTap: () {
                  _showEditDialog('Email', userData.email, (newValue) {
                    setState(() {
                      userData.changeEmail(newValue);
                    });
                  });
                },
              ),
              _buildProfileItem(
                title: 'Info',
                value: userData.info,
                onTap: () {
                  _showEditDialog('Info', userData.info, (newValue) {
                    setState(() {
                      userData.changeInfo(newValue);
                    });
                  });
                },
              ),
              const SizedBox(height: 15),
              const Text(
                'Kaitkan Akun:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildLinkAccountItem(
                title: 'Google',
                icon: const Icon(FontAwesomeIcons.google),
                onTap: () {
                  alertToast.commingSoon();
                },
              ),
              _buildLinkAccountItem(
                title: 'Instagram',
                icon: const Icon(FontAwesomeIcons.instagram),
                onTap: () {
                  alertToast.commingSoon();
                },
              ),
              _buildLinkAccountItem(
                title: 'Facebook',
                icon: const Icon(FontAwesomeIcons.facebook),
                onTap: () {
                  alertToast.commingSoon();
                },
              ),
              _buildLinkAccountItem(
                title: 'Twitter',
                icon: const Icon(FontAwesomeIcons.twitter),
                onTap: () {
                  alertToast.commingSoon();
                },
              ),
              const SizedBox(height: 38),
            ],
          ),
        ),
      );
    }

    Widget _buildProfileItem({
      required String title,
      required String value,
      required VoidCallback onTap,
    }) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: const TextStyle(fontSize: 16),
              ),
              IconButton(
                onPressed: () => onTap(),
                icon: const Icon(Icons.edit),
              ),
            ],
          ),
          const Divider(),
        ],
      );
    }

    Widget _buildLinkAccountItem({
      required String title,
      required Icon icon,
      required VoidCallback onTap,
    }) {
      return GestureDetector(
        onTap: onTap,
        child: ListTile(
          leading: icon,
          title: Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      );
    }

    void _showEditDialog(
      String title,
      String currentValue,
      Function(String) onSave,
    ) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          TextEditingController controller = TextEditingController(text: currentValue);
          return AlertDialog(
            title: Text('Edit $title'),
            content: TextFormField(
              controller: controller,
              decoration: InputDecoration(hintText: 'Enter new $title'),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  onSave(controller.text);
                  widget.onUserDataChanged(userData);
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ],
          );
        },
      );
    }
  }
