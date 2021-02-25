///base
final baseUrl = 'http://178.154.232.29:8000';
final baseUrlTest = 'http://test.dentistry.hellfish.ru';
final apiUrl ='/api/v1';

//sign int

final registerUrl = '$baseUrl$apiUrl/user/register';
final registerUrlTest = '$baseUrlTest$apiUrl/dev/user/register';
final confirmCodeUrlTest = '$baseUrlTest$apiUrl/user/confirm';
final authorizationUrlTest = '$baseUrlTest$apiUrl/user/login';
final updateUserDataUrlTest = '$baseUrlTest$apiUrl/user';
// final updatePasswordUrlTest = '$baseUrlTest/api​/v1​/user​/password';
final updatePasswordUrlTest = '$baseUrlTest$apiUrl/user/password';
final restoreUrlText = '$baseUrlTest$apiUrl/dev/user/restore';