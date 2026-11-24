import 'package:flutter/material.dart';
import 'package:flutter_quiz_2_wheather_app/Models/AuthModel.dart';
import 'package:flutter_quiz_2_wheather_app/Services/AuthService.dart';

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
    required String Password,
    required String Phone,

  }) async {
    signUpModel = await AuthService.Register(
      Name: Name,
      Email: Email,
      Password: Password,
      Phone: Phone
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
