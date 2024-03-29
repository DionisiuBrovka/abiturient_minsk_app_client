import 'dart:convert';

import 'package:flutter_eduapp_new/data/models/faq_model.dart';
import 'package:http/http.dart' as http;

class FAQRepository {

  static Future<List<FAQModel>> getFAQ() async {
    List<FAQModel> result = [];

    await Future.delayed(const Duration(seconds: 1));
    
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/v2/faq/'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        result.add(FAQModel.fromJson(index));
      }
    }
    return result;
  }
}