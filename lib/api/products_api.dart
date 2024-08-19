import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchAllUser() async {
  final response = http.get(Uri.parse('http://localhost:3000/users/getAll'));

  return [];
}
