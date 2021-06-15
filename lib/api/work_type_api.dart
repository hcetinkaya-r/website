import 'package:http/http.dart' as http;

class WorkTypeApi {
  static Future getWorkTypes() {
    var url = Uri.parse('http://localhost:3000/workTypes');
    return http.get(url);
  }
}
