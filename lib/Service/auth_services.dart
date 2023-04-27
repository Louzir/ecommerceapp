import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_ecommerce_app/Helpers/secure_storage_frave.dart';
import 'package:flutter_ecommerce_app/Service/urls.dart';
import 'package:flutter_ecommerce_app/Models/Response/response_auth.dart';


class AuthServices {

  
  Future<ResponseAuth> login({ required String email, required String password }) async {

    final resp = await http.post(Uri.parse('${URLS.urlApi}/auth/login'),
      headers: { 'Accept' : 'application/json' },
      body: {
        'email' : email,
        'passwordd' : password
      }
    );

    return ResponseAuth.fromJson( jsonDecode( resp.body ) );
  }


  Future<ResponseAuth> renewToken() async {

    final token = await secureStorage.readToken();

    final resp = await http.get(Uri.parse('${URLS.urlApi}/auth/renew-login'),
      headers: { 'Accept'   : 'application/json', 'xxx-token' : token!}
    );

    return ResponseAuth.fromJson( jsonDecode( resp.body ) );
  }


}


final authServices = AuthServices();