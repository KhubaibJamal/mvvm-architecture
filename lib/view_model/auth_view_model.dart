import 'package:flutter/material.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/utils.dart';

class AuthViewModel extends ChangeNotifier {
  // object of auth repository
  AuthRepository authRepository = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

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
}
