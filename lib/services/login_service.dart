import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Future<Map<String, dynamic>> loginUser(
      String username, String password) async {
    final url = Uri.parse('https://dummyjson.com/user/login');
    final headers = {'Content-Type': 'application/json'};

    final body = jsonEncode({'username': username, 'password': password});

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
        
      } else {
        return {'error': 'login faliled : ${response.statusCode}'};
      }
    } catch (e) {
      return {'error': 'login faliled : $e'};
    }
  }
}
