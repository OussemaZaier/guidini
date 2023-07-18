import 'package:dio/dio.dart';
import 'package:guidini/Network/BaseApiService.dart';

class NetworkApiService extends BaseApiService {
  final dio = Dio();

  @override
  Future<Map<String, dynamic>> getResponse(
      String url, Map<String, dynamic> data) async {
    try {
      Response response = await dio.get(
        url,
        queryParameters: data,
      );

      // Handle the response
      if (response.statusCode == 200) {
        // Request successful
        print(response.data);
      } else {
        // Request failed
        print('Request failed with status code: ${response.statusCode}');
      }
    } catch (error) {
      // Exception occurred during the request
      print('An error occurred: $error');
    }

    // Add a return statement at the end
    return {}; // Return an empty map as a default value
  }
}
