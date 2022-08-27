import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

import 'package:bloom_mobile/components/snackbar.dart';
import 'package:bloom_mobile/services/http_response.dart';

var api = dotenv.env['API_URL']!;

GetStorage storage = GetStorage();

class RoleService {
  final token = storage.read('token');

  get() async {
    try {
      final res = (await http.get(Uri.parse('$api/api/roles'), headers: {
        "Authorization": "Bearer $token",
      }));

      return HttpResponse.fromJson(res.statusCode, res.body).body.data;
    } catch (e) {
      snackbarError(e.toString());
    }
  }
}
