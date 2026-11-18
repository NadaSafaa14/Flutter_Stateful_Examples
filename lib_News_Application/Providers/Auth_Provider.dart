import 'package:flutter/material.dart';
import 'package:flutter_news_application/Models/Auth_Model.dart';
import 'package:flutter_news_application/Services/Auth_Service.dart';

class AuthProvider extends ChangeNotifier {
  bool isPasswordVisible = false;
  bool isConfirmVisible = false;

  void togglePassword() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void toggleConfirm() {
    isConfirmVisible = !isConfirmVisible;
    notifyListeners();
  }

  AuthModel? signUpModel;
  AuthModel? logInModel;


  RegisterData({
    required String Name,
    required String Email,
    required String Phone,
    required String Password,
  }) async {
    signUpModel = await AuthService.Register(
      Name: Name,
      Email: Email,
      Phone: Phone,
      Password: Password,
    );
  }

  LoginData({
    required String Email,
    required String Password,
  }) async {
    logInModel = await AuthService.LogIn(
      Email: Email,
      Password: Password,
    );
  }
}
