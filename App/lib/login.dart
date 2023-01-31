import 'package:app/customWidgets.dart';
import 'package:app/db.dart';
import 'package:app/navigation.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  var email = TextEditingController();
  var password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _form(),
    );
  }

  Widget _form() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20,),
        const Text(
          'Login',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        const SizedBox(height: 20,),
        myTextField(controllerTxt: email, hintTxt: 'enter email',type: TextInputType.text),
        myTextField(controllerTxt: password, hintTxt: 'enter password',type: TextInputType.text),
        myButton(txt: 'Login'),
        TextButton(
            onPressed: ()=>Navigation.signupPage(),
            child: const Text('Don,t have an account? Signup'),
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

  void _submitForm() {
    Db().login(email: email.text.toString(), password: password.text.toString());
     email.clear();
     password.clear();
  }
}
