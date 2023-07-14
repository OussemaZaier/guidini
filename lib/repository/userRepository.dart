import 'package:guidini/Network/BaseApiService.dart';
import 'package:guidini/Network/NetworkApiService.dart';
import 'package:guidini/models/userModel.dart';

class UserRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<User?> getUser(String email) async {
    try {
      Map<String, dynamic> response =
          await _apiService.getResponse('url', {'email': email});
      print('response');
      return User.fromJson(response['body']);
    } catch (e) {
      print(e);
    }
  }
}
