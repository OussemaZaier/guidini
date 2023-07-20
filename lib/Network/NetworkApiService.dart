import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:guidini/Network/ApiResponse.dart';
import 'package:guidini/Network/BaseApiService.dart';

class NetworkApiService<T> extends BaseApiService {
  final dio = Dio();
  @override
  Future<Map<String, dynamic>> get(String url) async {
    var apiResponse = ApiResponse<T>.loading();

    try {
      final response = await dio.get(
        url,
      );

      // Handle the response
      if (response.statusCode == 200) {
        // Request successful
        if (kDebugMode) {
          print(response.data);
        }
        apiResponse = ApiResponse.completed(response.data);
      } else {
        // Request failed
        if (kDebugMode) {
          print('Request failed with status code: ${response.statusCode}');
        }
        apiResponse = ApiResponse.error(response.data);
      }
    } catch (error) {
      // Exception occurred during the request
      if (kDebugMode) {
        print('An error occurred: $error');
      }
      apiResponse = ApiResponse.error({"error": error});
    }
    return apiResponse.toJson();
  }

  @override
  Future getById(String url, String id) async {
    var apiResponse = ApiResponse<T>.loading();

    try {
      final response = await dio.get(
        url,
        //queryParameters: data,
      );

      // Handle the response
      if (response.statusCode == 200) {
        // Request successful
        if (kDebugMode) {
          print(response.data);
        }
        apiResponse = ApiResponse.completed(response.data);
      } else {
        // Request failed
        if (kDebugMode) {
          print('Request failed with status code: ${response.statusCode}');
        }
        apiResponse = ApiResponse.error(response.data);
      }
    } catch (error) {
      // Exception occurred during the request
      if (kDebugMode) {
        print('An error occurred: $error');
      }
      apiResponse = ApiResponse.error({"error": error});
    }
    return apiResponse.toJson();
  }

  @override
  Future post(String url, Map<String, dynamic> body) async {
    var apiResponse = ApiResponse<T>.loading();

    try {
      final response = await dio.post(url, data: body);

      // Handle the response
      if (response.statusCode == 200) {
        // Request successful
        if (kDebugMode) {
          print(response.data);
        }
        apiResponse = ApiResponse.completed(response.data);
      } else {
        // Request failed
        if (kDebugMode) {
          print('Request failed with status code: ${response.statusCode}');
        }
        apiResponse = ApiResponse.error(response.data);
      }
    } catch (error) {
      // Exception occurred during the request
      if (kDebugMode) {
        print('An error occurred: $error');
      }
      apiResponse = ApiResponse.error({"error": error});
    }
    return apiResponse.toJson();
  }
}
