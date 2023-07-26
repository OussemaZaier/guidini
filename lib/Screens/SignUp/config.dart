<<<<<<< HEAD
const url = 'http://10.217.8.90:3000';
const registration = '$url/auth/signup';
const login = '$url/auth/login';
const getUsers = '$url/user';
const ads = '$url/ad';
=======
final url = 'http://10.217.8.139:3000';
final registration = url + '/auth/signup';
final login = url + '/auth/login';
final getUsers = url + '/user';
final ads = url + '/ad';
String findInv(String id) {
  return url + '/inventory/findByUser/' + id;
}
>>>>>>> a02fb7864b85c94c16a82f6412634b1143554576

String getUser(String id) {
  return '$url/user/$id';
}

String getInv(String id) {
  return '$url/inventory/$id';
}
