import 'package:app/contact.dart';
import 'package:app/contacts.dart';
import 'package:app/login.dart';
import 'package:app/signup.dart';
import 'package:get/get.dart';


class Navigation {

  static void signupPage()=> Get.to(()=>const SignUp());
  static void loginPage() => Get.offAll(()=>const Login());
  static void addContact() => Get.to(()=>const Contact());
  static void contactsList() => Get.to(()=>const Contacts());

}