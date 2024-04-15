
import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpService {
  String baseUrl = "https://www.demo.odofortius.in";
  Future postWithBody(endpoint, Map<String, String> body) async {
    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl$endpoint'));
    request.fields.addAll(body);

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        return {
          "status": response.statusCode,
          "data": json.decode(await response.stream.bytesToString())
        };
      } else {
        return {"status": response.statusCode, "data": response.reasonPhrase};
      }
    } catch (e) {
      return {"status": 0, "data": e.toString()};
    }
  }
}
