import 'package:flutter/foundation.dart';
import 'package:flutter_application_dio_random_user/Models/random_user_model.dart';
import 'package:flutter_application_dio_random_user/Services/random_user_service.dart';

class RandomUserProvider extends ChangeNotifier
{
  RandomUserModel? randomUserModel;
  
  getRandomUserData() async
  {
    randomUserModel = await RandomUserService.getRandomUsers();
    notifyListeners();
  }
}