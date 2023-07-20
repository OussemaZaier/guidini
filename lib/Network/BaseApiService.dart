abstract class BaseApiService {
  Future<dynamic> get(String url);
  Future<dynamic> getById(String url, String id);
  Future<dynamic> post(String url, Map<String, dynamic> body);
  Future<dynamic> update(String url, Map<String, dynamic> body);
}
