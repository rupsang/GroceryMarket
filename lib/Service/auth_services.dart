import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:e_commers/Helpers/secure_storage_frave.dart';
import 'package:e_commers/Service/urls.dart';
import 'package:e_commers/Models/Response/response_auth.dart';

class AuthServices {
  Future<ResponseAuth> login(
      {required String email, required String password}) async {
    final bodyMessage = jsonEncode({'email': email, 'password': password});
    final resp = await http.post(Uri.parse('${URLS.baseUrl}user/login'),
        headers: {'Content-Type': 'application/json'}, body: bodyMessage);
    return ResponseAuth.fromJson(jsonDecode(resp.body), resp.statusCode);
  }

  Future<ResponseAuth> renewToken() async {
    final token = await secureStorage.readToken();

    final resp = await http.get(Uri.parse('${URLS.urlApi}/auth/renew-login'),
        headers: {'Accept': 'application/json', 'xxx-token': token!});

    return ResponseAuth.fromJson(jsonDecode(resp.body), resp.statusCode);
  }
}

final authServices = AuthServices();
