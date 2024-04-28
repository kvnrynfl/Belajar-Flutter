import 'package:fluttertoast/fluttertoast.dart';

class AlertToast {
  void custom(String pesanTampil) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(msg: pesanTampil, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.TOP, timeInSecForIosWeb: 1);
  }

  void commingSoon() {
    Fluttertoast.cancel();
    Fluttertoast.showToast(msg: "This Feature is coming soon", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.TOP, timeInSecForIosWeb: 1);
  }
}
