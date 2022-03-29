bool obscureText = true;
dynamic userData = [];

String baseUrl = "employee.mtechtesting.com";
String version = "api/";
String login = "login";
String register = "auth/register";
String getVendors = "get-vendors";
String qrTransection = "transection";

dynamic headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
};

dynamic authHeaders = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  // 'Authorization': 'Bearer ${userData["token"]}',
};
