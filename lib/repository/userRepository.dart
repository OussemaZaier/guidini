import 'package:guidini/Network/BaseApiService.dart';
import 'package:guidini/Network/NetworkApiService.dart';
import 'package:guidini/models/userModel.dart';

class UserRepository {
  final _apiService = NetworkApiService<User>();

  Future<User?> getUser(String email) async {
    try {
      Map<String, dynamic> response = await _apiService.getById('url', email);
      print('response');
      return User.fromJson(response['body']);
    } catch (e) {
      print(e);
    }
  }
}
