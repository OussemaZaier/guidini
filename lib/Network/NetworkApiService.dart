import 'package:dio/dio.dart';
import 'package:guidini/Network/ApiResponse.dart';
import 'package:guidini/Network/BaseApiService.dart';

class NetworkApiService extends BaseApiService {
  final dio = Dio();

  @override
  Future<Map<String, dynamic>> getResponse(
      String url, Map<String, dynamic> data) async {
    var apiResponse = ApiResponse.loading();

    try {
      Response response = await dio.get(
        url,
        //queryParameters: data,
      );

      // Handle the response
      if (response.statusCode == 200) {
        // Request successful
        print(response.data);
        apiResponse = ApiResponse.completed(response.data);
      } else {
        // Request failed
        print('Request failed with status code: ${response.statusCode}');
        apiResponse = ApiResponse.error(response.data);
      }
    } catch (error) {
      // Exception occurred during the request
      print('An error occurred: $error');
      apiResponse = ApiResponse.error({"error": error});
    }
    return apiResponse.toJson();
  }
}
