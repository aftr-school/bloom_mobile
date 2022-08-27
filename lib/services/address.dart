import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

import 'package:bloom_mobile/components/snackbar.dart';
import 'package:bloom_mobile/services/http_response.dart';

var api = dotenv.env['API_URL']!;

GetStorage storage = GetStorage();

class AddressService {
  final token = storage.read('token');

  getProvinces() async {
    try {
      final res = (await http.get(Uri.parse('$api/api/regional/province'), headers: {
        "Authorization": "Bearer $token",
      }));

      return HttpResponse.fromJson(res.statusCode, res.body).body.data;
    } catch (e) {
      snackbarError(e.toString());
    }
  }

  getRegencies(int provinceId) async {
    try {
      final res =
          (await http.get(Uri.parse('$api/api/regional/regency/$provinceId/province'), headers: {
        "Authorization": "Bearer $token",
      }));

      return HttpResponse.fromJson(res.statusCode, res.body).body.data;
    } catch (e) {
      snackbarError(e.toString());
    }
  }

  getDistricts(int regencyId) async {
    try {
      final res =
          (await http.get(Uri.parse('$api/api/regional/district/$regencyId/regency'), headers: {
        "Authorization": "Bearer $token",
      }));

      return HttpResponse.fromJson(res.statusCode, res.body).body.data;
    } catch (e) {
      snackbarError(e.toString());
    }
  }

  getVillages(int districtId) async {
    try {
      final res =
          (await http.get(Uri.parse('$api/api/regional/village/$districtId/district'), headers: {
        "Authorization": "Bearer $token",
      }));

      return HttpResponse.fromJson(res.statusCode, res.body).body.data;
    } catch (e) {
      snackbarError(e.toString());
    }
  }
}
