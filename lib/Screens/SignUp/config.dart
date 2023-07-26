const url = 'http://10.217.8.90:3000';
const registration = '$url/auth/signup';
const login = '$url/auth/login';
const getUsers = '$url/user';
const ads = '$url/ad';

String getUser(String id) {
  return '$url/user/$id';
}

String getInv(String id) {
  return '$url/inventory/$id';
}
