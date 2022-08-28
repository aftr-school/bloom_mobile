import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../components/snackbar.dart';
import 'http_response.dart';

var api = dotenv.env['API_URL']!;

GetStorage storage = GetStorage();

class ProductService {
  final token = storage.read('token');
  final userId = storage.read('userId');

  Future get() async {
    try {
      final res = await http
          .get(Uri.parse('$api/api/product/farmer/$userId'), headers: {
        "Authorization": "Bearer $token",
      });

      return HttpResponse.fromJson(res.statusCode, res.body).body.data;
    } catch (e) {
      snackbarError(e.toString());
    }
  }

  void post(Product data) async {
    try {
      final res = await http.post(Uri.parse('$api/api/product'), headers: {
        "Authorization": "Bearer $token",
      }, body: {
        'name': data.name,
        'price': data.price.toString(),
        'uom': data.uom,
        'quantity': data.qunatity.toString(),
        'product_category_id': data.productCategoryId.toString(),
        'anual_harvest': data.anualHarvest.toString(),
      });

      var newData =
          HttpResponseWithError.fromJson(res.statusCode, res.body, res);
      if (newData.statusCode == 422) {
        snackbarError(jsonDecode(newData.raw.body).toString());
      }

      snackbarSuccess('success');
    } catch (e) {
      snackbarError(e.toString());
    }
  }

  getCategory() async {
    try {
      final res = await http
          .get(Uri.parse('$api/api/datamaster/product/category'), headers: {
        "Authorization": "Bearer $token",
      });

      return HttpResponse.fromJson(res.statusCode, res.body).body.data;
    } catch (e) {
      snackbarError(e.toString());
    }
  }
}

class Product {
  final String name;
  final int price;
  final String uom;
  final int qunatity;
  final int productCategoryId;
  final int anualHarvest;

  const Product({
    required this.name,
    required this.price,
    required this.uom,
    required this.qunatity,
    required this.productCategoryId,
    required this.anualHarvest,
  });
}
