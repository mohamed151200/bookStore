import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ApiClient {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(receiveDataWhenStatusError: true,
        baseUrl:
            "https://www.googleapis.com/books/v1", // عدل الرابط حسب الـ API
      ),
    );
  }

  Future<List<dynamic>> searchBooks(String query) async {
    try {
      final response = await ApiClient.dio.get(
        "/volumes", // endpoint الخاص بـ Google Books API
        queryParameters: {
          "q": query, // كلمة البحث
        },
      );
      return response.data['items'] ?? [];
    } catch (e) {
      print("Error while searching books: $e");
      return [];
    }
  }

  Future<Response> getData({
    required String url,
    required Map<String,dynamic> query,
  }) async {
    return await dio.get(url,queryParameters: query);
  }

  //Dio get dio => _dio; // إتاحة Dio للاستخدام في باقي المشروع
}
