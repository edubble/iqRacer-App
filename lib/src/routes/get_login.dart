import 'dart:convert';
import 'package:http/http.dart' as http;

getData() async {
  const url = "http://rogercr2001-001-site1.itempurl.com/api/users";
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    String body = utf8.decode(response.bodyBytes);
    final jsonData = jsonDecode(body);

    return jsonData;
  }
}
