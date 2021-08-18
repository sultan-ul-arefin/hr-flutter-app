import 'package:api_sdk/main.dart';

class AuthenticationRepository {
  Future<dynamic> signUpWithEmailAndPassword(
      String email, String password) async {
    await Future.delayed(Duration(seconds: 1)); // simulate a network delay
    final response = await ApiSdk.signUpWithEmailAndPassword(
        {'email': email, 'password': password});

    return response;
  }

  Future<dynamic> loginWithIdAndPassword(
      String loginId, String password) async {
    await Future.delayed(Duration(seconds: 1)); // simulate a network delay
    final response = await ApiSdk.loginWithIdAndPassword(
        {'loginId': loginId, 'password': password});

    return response;
  }

  Future<dynamic> getUserData(int id) async {
    final response = await ApiSdk.getUserData(id);

    return response;
  }
}
