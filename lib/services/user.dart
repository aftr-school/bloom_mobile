import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

import 'package:bloom_mobile/components/snackbar.dart';
import 'package:bloom_mobile/services/http_response.dart';

var api = dotenv.env['API_URL']!;

GetStorage storage = GetStorage();

class UserService {
  final token = storage.read('token');
  final userId = storage.read('userId');

  get() async {
    try {
      final res = await http.get(Uri.parse('$api/api/auth/user'), headers: {
        "Authorization": "Bearer $token",
      });

      return HttpResponse.fromJson(res.statusCode, res.body).body.data;
    } catch (e) {
      snackbarError(e.toString());
    }
  }

  getArea(lat, long) async {
    try {
      final res = await http.get(
        Uri.parse('$api/api/users?lat=$lat&long=$long&radius=50'),
        headers: {
          "Authorization": "Bearer $token",
        },
      );

      return HttpResponse.fromJson(res.statusCode, res.body).body.data;
    } catch (e) {
      snackbarError(e.toString());
    }
  }
}
