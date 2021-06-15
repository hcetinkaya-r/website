import 'package:http/http.dart' as http;

class WorksApi {
  static Future getWorks() {
    var url = Uri.parse('http://localhost:3000/works');
    return http.get(url);
  }

  static Future getWorksByTypeId(int workTypeId) {
    var url = Uri.parse('http://localhost:3000/works?workTypeId=$workTypeId');

    return http.get(url);
  }
}
