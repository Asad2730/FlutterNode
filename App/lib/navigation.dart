import 'package:app/login.dart';
import 'package:app/signup.dart';
import 'package:get/get.dart';


class Navigation {

  static void signupPage()=> Get.to(()=>const SignUp());
  static void loginPage() => Get.to(()=>const Login());

}