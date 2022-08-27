import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:bloom_mobile/components/snackbar.dart';
import 'package:bloom_mobile/services/http_response.dart';

var api = dotenv.env['API_URL']!;

GetStorage storage = GetStorage();

class AuthService {
  final token = storage.read('token');

  _register(Register data) async {
    final res = await http.post(
      Uri.parse('$api/api/auth/register'),
      body: {
        "name": data.name,
        "username": data.username,
        "email": data.email,
        "password": data.password,
        "roleId": data.roleId,
        "address": data.address,
        "regenciesId": data.regenciesId,
        "villagesId": data.villagesId,
        "districtsId": data.districtsId,
        "provincesId": data.provincesId,
        "latitude": data.latitude,
        "longitude": data.longitude,
      },
    );

    return HttpResponse.fromJson(res.statusCode, res.body);
  }

  _login(Login data) async {
    final res = await http.post(
      Uri.parse('$api/api/auth/login'),
      body: {
        "username": data.username,
        "password": data.password,
      },
    );

    return HttpResponse.fromJson(res.statusCode, res.body);
  }

  _get() async {
    final res = await http.get(Uri.parse('$api/api/auth/user'), headers: {
      "Authorization": "Bearer $token",
    });

    return HttpResponse.fromJson(res.statusCode, res.body);
  }

  _logout() async {
    await http.post(Uri.parse('$api/api/logout'), headers: {
      "Authorization": "Bearer $token",
    });
  }

  registerService(Register data) async {
    try {
      HttpResponse res = await _register(data);

      if (res.statusCode == 422) {
        snackbarError('username or email have been used');
      } else if (res.body.status == 'success') {
        snackbarSuccess(res.body.message);
      } else {
        snackbarError(res.body.message);
      }
    } catch (e) {
      snackbarError(e.toString());
    }
  }

  loginService(Login data) async {
    try {
      HttpResponse res = await _login(data);

      if (res.body.status == 'success') {
        HttpResponse user = await _get();

        storage.write('token', res.body.data['token']);
        storage.write('name', user.body.data['name']);

        Get.offNamed('/');
      } else {
        snackbarError(res.body.message);
      }
    } catch (e) {
      snackbarError(e.toString());
    }
  }

  logoutService() async {
    try {
      await _logout();

      storage.remove('token');

      Get.offAllNamed('/login');
    } catch (e) {
      snackbarError(e.toString());
    }
  }
}

class Register {
  final String name;
  final String username;
  final String email;
  final String password;
  final int roleId;
  final String address;
  final int regenciesId;
  final int villagesId;
  final int districtsId;
  final int provincesId;
  final String latitude;
  final String longitude;

  const Register({
    required this.name,
    required this.username,
    required this.email,
    required this.password,
    required this.roleId,
    required this.address,
    required this.regenciesId,
    required this.villagesId,
    required this.districtsId,
    required this.provincesId,
    required this.latitude,
    required this.longitude,
  });
}

class Login {
  final String username;
  final String password;

  const Login({
    required this.username,
    required this.password,
  });
}
