import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  Future request(String url) async {
    http.Response response = await http.get(url);
    print(response.statusCode);
    print(json.decode(response.body));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    print(response.statusCode);
  }
}
