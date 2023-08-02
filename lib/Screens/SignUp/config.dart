final url = 'http://10.217.8.139:3000';
final registration = url + '/auth/signup';
final login = url + '/auth/login';
final getUsers = url + '/user';
final ads = url + '/ad';
String findInv(String id) {
  return url + '/inventory/findByUser/' + id;
}

String getUser(String id) {
  return '$url/user/$id';
}

String getInv(String id) {
  return '$url/inventory/$id';
}
