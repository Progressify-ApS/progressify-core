import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static initialize(String apiUrl, {String? debugApiUrl}) =>
      GetIt.instance.registerSingleton<ApiService>(
          ApiService(apiUrl, debugApiUrl: debugApiUrl ?? apiUrl));

  ApiService(this.apiUrl, {this.debugApiUrl});

  static ApiService get instance => GetIt.instance<ApiService>();

  late String apiUrl;
  String? debugApiUrl;
  Map<String, String>? authHeader;

  Future<ApiResponse> delete(String url,
      {Map<String, dynamic>? headers}) async {
    Uri path;
    try {
      if (kDebugMode) {
        path = Uri.http(debugApiUrl ?? apiUrl, url);
      } else {
        path = Uri.https(apiUrl, url);
      }
      http.Response response =
          await http.delete(path, headers: {...?authHeader, ...?headers});
      Object? decodedResponse = jsonDecode(response.body);
      return ApiResponse(
          code: response.statusCode,
          body: decodedResponse,
          rawResponse: response);
    } on Exception catch (e) {
      return ApiResponse(
          code: 501,
          body: {'success': false, 'error': e.toString()},
          rawResponse: null);
    }
  }

  Future<ApiResponse> get(String url, {Map<String, dynamic>? headers}) async {
    Uri path;
    try {
      if (kDebugMode) {
        path = Uri.http(debugApiUrl ?? apiUrl, url);
      } else {
        path = Uri.https(apiUrl, url);
      }
      http.Response response =
          await http.get(path, headers: {...?authHeader, ...?headers});
      Object? decodedResponse = jsonDecode(response.body);
      return ApiResponse(
          code: response.statusCode,
          body: decodedResponse,
          rawResponse: response);
    } on Exception catch (e) {
      return ApiResponse(
          code: 501,
          body: {'success': false, 'error': e.toString()},
          rawResponse: null);
    }
  }

  Future<ApiResponse> patch(
    String url, {
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
  }) async {
    Uri path;
    try {
      if (kDebugMode) {
        path = Uri.http(debugApiUrl ?? apiUrl, url);
      } else {
        path = Uri.https(apiUrl, url);
      }
      http.Response response = await http
          .patch(path, body: body, headers: {...?authHeader, ...?headers});
      Object? decodedResponse = jsonDecode(response.body);
      return ApiResponse(
          code: response.statusCode,
          body: decodedResponse,
          rawResponse: response);
    } on Exception catch (e) {
      return ApiResponse(
          code: 501,
          body: {'success': false, 'error': e.toString()},
          rawResponse: null);
    }
  }

  Future<ApiResponse> post(
    String url, {
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
  }) async {
    Uri path;
    try {
      if (kDebugMode) {
        path = Uri.http(debugApiUrl ?? apiUrl, url);
      } else {
        path = Uri.https(apiUrl, url);
      }
      http.Response response = await http
          .post(path, body: body, headers: {...?authHeader, ...?headers});
      Object? decodedResponse = jsonDecode(response.body);
      return ApiResponse(
          code: response.statusCode,
          body: decodedResponse,
          rawResponse: response);
    } on Exception catch (e) {
      return ApiResponse(
          code: 501,
          body: {'success': false, 'error': e.toString()},
          rawResponse: null);
    }
  }

  Future<ApiResponse> put(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  }) async {
    Uri path;
    try {
      if (kDebugMode) {
        path = Uri.http(debugApiUrl ?? apiUrl, url);
      } else {
        path = Uri.https(apiUrl, url);
      }
      http.Response response = await http
          .put(path, body: body, headers: {...?authHeader, ...?headers});
      Object? decodedResponse = jsonDecode(response.body);
      return ApiResponse(
          code: response.statusCode,
          body: decodedResponse,
          rawResponse: response);
    } on Exception catch (e) {
      return ApiResponse(
          code: 501,
          body: {'success': false, 'error': e.toString()},
          rawResponse: null);
    }
  }
}

class ApiResponse {
  Object? body;
  int code;
  http.Response? rawResponse;

  ApiResponse({required this.code, required this.rawResponse, this.body});
}
