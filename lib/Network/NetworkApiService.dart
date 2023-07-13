
import 'package:get/get.dart';
import 'package:guidini/Network/BaseApiService.dart';

class NetworkApiService extends BaseApiService {
  final dio = Dio();

  @override
  Future<Map<String, dynamic>> getResponse(
      String url, Map<String, dynamic> data) async {
    try {
      Response response = await dio.get('https://dart.dev');
      return {"res": response};
    } catch (e) {
      return {"error": e.toString()};
    }
  }
}

class Dio {
  get(String s) {}
}
