import 'package:flutter/material.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/utils.dart';

class AuthViewModel extends ChangeNotifier {
  // object of auth repository
  AuthRepository authRepository = AuthRepository();

  bool _loginLoading = false;
  bool get loginLoading => _loginLoading;

  setLoading(bool value) {
    _loginLoading = value;
    notifyListeners();
  }

  // for login
  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);

    authRepository.loginApi(data).then((value) {
      setLoading(false);
      Utils.flushBarErrorMessage("Login Successfully", context);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  // for sign up
  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);
    authRepository.signUpApi(data).then((value) {
      setSignUpLoading(false);
      Utils.flushBarErrorMessage("Sign-up Successfully", context);
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }
}
