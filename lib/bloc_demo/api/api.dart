import 'package:http/http.dart' as http;

class Api {
  Future<http.Response> getAlbum() async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
      return response;
    } catch (e) {
      print(e);
      return http.Response(e.toString(), 500);
    }
  }
}
