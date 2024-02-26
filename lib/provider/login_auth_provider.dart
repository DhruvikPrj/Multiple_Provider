import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void login(String email, String password) async {
    //set value of loading
    setLoading(true);

    //exception handling
    try {
      Response response = await post(
          Uri.parse("http://192.168.1.7:4000/api/v1/user/login"),
          body: {
            "email": email,
            "password": password,
          });
      if (response.statusCode == 200) {
        print('Login Successfully');
        setLoading(false);
        return;
      } else {
        // showDialog(
        //                   context: context,
        //                   builder: (context) {
        //                     return const AlertDialog(
        //                       title: Text('Login Failed'),
        //                       content:
        //                           Text('Please enter valid credentials...'),
        //                     );
        //                   },
        //                 );
        print("failed");
      }
    } catch (e) {
      print(e.toString());
      setLoading(false);
    }
  }
}
