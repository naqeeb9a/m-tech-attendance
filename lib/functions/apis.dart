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
      return "Success";
      // return jsonDecode(response.body)["message"];
    } else {
      return "Error";
    }
  }

  vendorsList() async {
    var url = Uri.https(baseUrl, version + getVendors);

    var response = await http.get(url, headers: authHeaders);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)["data"];
    } else {
      return jsonDecode(response.body)["message"];
    }
  }

  transactionFunc(key, userId, vendorId, total, discount) async {
    var jsonBody = {
      "transection_key": key,
      "user_id": userId,
      "vendor_id": vendorId,
      "total_amount": total,
      "discount": discount,
    };

    var url = Uri.https(baseUrl, version + qrTransection);

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
