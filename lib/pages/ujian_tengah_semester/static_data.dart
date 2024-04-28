class StaticData {
  String profileName = 'Kevin Reynaufal';
  String phoneNumber = '082217265234';
  String email = 'kevinreynaufal2004@gmail.com';
  String info = '';
  String password = '12345';
  bool loggedInStatus = false;

  String getProfileName() {
    return profileName;
  }

  void changeProfileName(String newName) {
    profileName = newName;
  }

  String getPhoneNumber() {
    return phoneNumber;
  }

  void changePhoneNumber(String newPhone) {
    phoneNumber = newPhone;
  }

  String getEmail() {
    return email;
  }

  void changeEmail(String newEmail) {
    email = newEmail;
  }

  String getInfo() {
    return info;
  }

  void changeInfo(String newInfo) {
    info = newInfo;
  }

  String getPassword() {
    return password;
  }

  void changePassword(String newPassword) {
    password = newPassword;
  }

  bool getLoggedInStatus() {
    return loggedInStatus;
  }

  void changeLoggedInStatus(bool newLoggedInStatus) {
    loggedInStatus = newLoggedInStatus;
  }
}
