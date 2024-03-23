import 'package:dio/dio.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class ApiCaller {
  static const baseUrl = 'https://jsonplaceholder.typicode.com';
  static final _dio = Dio(BaseOptions(responseType: ResponseType.plain));

  Future<String> get(String endpoint, {Map<String, dynamic>? params}) async {
    try {
      final response =
          await _dio.get('$baseUrl/$endpoint', queryParameters: params);
      debugPrint('Status code: ${response.statusCode}');
      debugPrint(response.data.toString());
      return response.data.toString();
    } on DioException catch (e) {
      var msg = e.response?.data.toString();
      debugPrint(msg);
      throw Exception(msg);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<String> post(String endpoint,
      {required Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.post('$baseUrl/$endpoint', data: params);
      debugPrint('Status code: ${response.statusCode}');
      debugPrint(response.data.toString());
      return response.data.toString();
    } on DioException catch (e) {
      var msg = e.response?.data.toString();
      debugPrint(msg);
      throw Exception(msg);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}