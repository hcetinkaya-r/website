import 'package:http/http.dart' as http;

class WebUserApi {
  static Future getWebUser() {
    var url = Uri.parse('http://localhost:3000/webUser');
    return http.get(url);
  }
}
