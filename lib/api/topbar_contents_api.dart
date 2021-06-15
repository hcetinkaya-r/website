import 'package:http/http.dart' as http;

class TopBarContentsApi {
  static Future getTopBarContents() {
    var url = Uri.parse('http://localhost:3000/topbarContents');
    return http.get(url);
  }
}
