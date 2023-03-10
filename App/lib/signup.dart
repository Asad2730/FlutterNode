import 'package:app/customWidgets.dart';
import 'package:app/db.dart';
import 'package:flutter/material.dart';

import 'navigation.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  var email = TextEditingController();
  var password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    email.addListener(() {
      print('email : ${email.text}');
    });
    password.addListener(() {
      print('password : ${password.text}');
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _form(),
    );
  }

  void _submitForm() {
     Db().signup(
         email: email.text.toString(), password: password.text.toString());
     email.clear();
     password.clear();
  }



  Widget _form() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20,),
        const Text(
          'SignUp',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        const SizedBox(height: 20,),
        myTextField(controllerTxt: email, hintTxt: 'enter email',type: TextInputType.emailAddress),
        myTextField(controllerTxt: password, hintTxt: 'enter password',type: TextInputType.text),
       myButton(txt: 'Signup'),
        TextButton(
          onPressed: ()=>Navigation.loginPage(),
          child: const Text('Have an account? Login'),
        ),
      ],
    );
  }


  Widget myButton( {required String txt}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: ElevatedButton(
        onPressed: ()=>_submitForm(),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: Colors.blueAccent,
          minimumSize: const Size(350, 55),
          maximumSize: const Size(350, 55),
        ),
        child: Text(
          txt,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}



