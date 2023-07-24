final url = 'http://10.72.0.126:3000';
final registration = url + '/auth/signup';
final login = url + '/auth/login';
final getUsers = url + '/user';
final ads = url + '/ad';

String getUser(String id) {
  return url + '/user/' + id;
}
