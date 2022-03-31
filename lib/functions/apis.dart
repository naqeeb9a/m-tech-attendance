import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';

class Functions {
  loginFunc(email, password) async {
    var jsonBody = {
      "email": email,
      "password": password,
    };

    var url = Uri.https(baseUrl, version + login);

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(jsonBody),
    );

    if (response.statusCode == 200) {
      SharedPreferences loginResponse = await SharedPreferences.getInstance();
      loginResponse.clear();
      userData = jsonDecode(response.body)['data'];
      loginResponse.setString("LoginResponse", json.encode(userData));
      return jsonDecode(response.body)["message"];
    } else {
      return jsonDecode(response.body)["message"];
    }
  }

  markAttendance() async {
    var jsonBody = {
      "email": userData["email"],
    };

    var url = Uri.https(baseUrl, version + markAttendanceApi);

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(jsonBody),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)["message"];
    } else {
      return jsonDecode(response.body)["message"];
    }
  }
}
