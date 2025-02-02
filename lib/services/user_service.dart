import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class UserService {
  final String apiUrl = 'https://dummyjson.com/user/me';
  final String accessToken =
      'YOUR_ACCESS_TOKEN_HERE'; // Ganti dengan token yang benar
  String data = '';
  // Fungsi untuk mengambil data dari API
  Future<Map<String, dynamic>> fetchUserData() async {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer $accessToken', // Menambahkan Bearer token
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Jika API mengembalikan response dengan status 200 OK
      return jsonDecode(response.body);
      
    } else {
      // Jika API gagal
      throw Exception('Failed to fetch user data');
    }
  }
}
